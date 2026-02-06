function MCC=MCC_measure(sen,spec)

MCC=(((sen*spec)-(1-spec)*(1-sen)))/sqrt((sen+(1-spec))*(sen+(1-sen))*(spec+(1-spec))*(spec+(1-sen)));
