#!/bin/bash
function run_test {
    echo $1
    EXPECTED_OUTPUT=$($1)
    EXPECTED_STATUS=$?
    ACTUAL_OUTPUT=$($2)
    ACTUAL_STATUS=$?

    if [ "$EXPECTED_STATUS" -ne "$ACTUAL_STATUS" ]; then
        diff  <(echo "$EXPECTED_STATUS") <(echo "$ACTUAL_STATUS")
        echo "Status Failure"
        TEST_RESULT=$(($TEST_RESULT + 1))
    fi

    if [ "$EXPECTED_OUTPUT" != "$ACTUAL_OUTPUT" ]; then
        diff  <(echo "$EXPECTED_OUTPUT") <(echo "$ACTUAL_OUTPUT")
        echo "Output Failure"
        TEST_RESULT=$(expr "$TEST_RESULT + 1")
    fi
}
make
TEST_RESULT=0

run_test "./tail input.txt" "tail input.txt"
# run_test "./tail non-existent.txt" "tail non-existent.txt"

exit $TEST_RESULT