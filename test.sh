make

EXPECTED_OUTPUT=$(tail input.txt)
EXPECTED_STATUS=$?
ACTUAL_OUTPUT=$(./tail input.txt)
ACTUAL_STATUS=$?

TEST_RESULT=0

if [ "$EXPECTED_STATUS" -ne "$ACTUAL_STATUS" ]; then
    diff  <(echo "$EXPECTED_STATUS") <(echo "$ACTUAL_STATUS")
    echo "Status Failure"
    TEST_RESULT=1
fi

if [ "$EXPECTED_OUTPUT" != "$ACTUAL_OUTPUT" ]; then
    diff  <(echo "$EXPECTED_OUTPUT") <(echo "$ACTUAL_OUTPUT")
    echo "Output Failure"
    TEST_RESULT=1
fi

exit $TEST_RESULT