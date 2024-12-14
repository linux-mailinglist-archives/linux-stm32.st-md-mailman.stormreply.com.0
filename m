Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 280229F2132
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Dec 2024 23:21:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9CB8C6C841;
	Sat, 14 Dec 2024 22:21:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAFF2C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Dec 2024 22:21:22 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BELZHhS008466
 for <linux-stm32@st-md-mailman.stormreply.com>; Sat, 14 Dec 2024 22:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XFgyAxvNra4DPanTeeFOl2uaHZeaHsP5CLLrDFBo6ho=; b=dVIqkSuoN1p8Gj6V
 Htso3DGgxvvZTckg+iGOn8Te8TmY8zi0Ul8RuMhXD5aayWi1InUIpBvgskv0+iU6
 N7v6KmYXwUHVnUMepOG8u/jj+ZwbpQFm4JgAGp6uqdF5OhxD5doGg21U3qg6lcYF
 eaw8M8kNAsnzGEJ6KinPnLkGgAJ+FyfwnGyNdWuOTlV8oTz6DOVMFpohEa2qbVP2
 3HsrvY85BxRJBrgpSfAYD5DJ2qlMA4d9Ef4pdc9d10D3hDLzl7912ODkEXIthCAB
 x3pU84P+05WHH4SjMujXU8E2u91BpIHNKGIc8vqN03LuxdfZYaDVEgH9X9YEilbL
 PGNbTA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43hbft8fn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Dec 2024 22:21:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6d881a3e466so7882856d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Dec 2024 14:21:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734214879; x=1734819679;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XFgyAxvNra4DPanTeeFOl2uaHZeaHsP5CLLrDFBo6ho=;
 b=g982ARroOF185NrLhzH4kbFPPGfBYMuPjfalh4TlspnONVV19CKB7FalJxz+6HiOJq
 g2H1SSCptWYkFfQ2mIBkCojbfk+4Hmq89+WPa6/84VplgVJQWSlrWvKkCHTEAxXpMa3K
 Es7bduO3RYG6gXaIOkSods8iGqvPhcu+5ajsQt3CC3SLpSPdhL8q6o/XUk54XgxzOKR5
 N9hrtM59M4vPstj+wtc3gpi+k0U/X08t9Avd9iwUXbI/Yu5PzgLdb551KW56zn59J0z/
 Q2uhM8sX95R7kEkDBOzs0AUHnqQCheJKLs0nM0bzdf9C/WPEQn/seYTCBF2M024FzaJ5
 iycQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNWcEwg8B7xuEmR6qKYuAMwIgRSZA3HtjD8EDaUTSvz0HGnWqgn3FUVJMT+M6BTNCCL8WYarK+PtFCGQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyJk4ib9s+FRGSPFYXVil9wCUOK3PE2evm05HN4vx2fTg/yCL5W
 LB0IQs0QDZ+whdls5T4PvupTbu4efMiV3XQkmn7r3qOUZXMwL3QeCoe9/zkuZcH2A5UrJP5pPP/
 K4gMP9LedpRE+rGzFr6XgC0wTi/Tg11FCu6kCeXvzP2T+DI239T4pZPSO5L/ay1O18txjn36/im
 SS6Rw=
X-Gm-Gg: ASbGncvYbxEpXbc/TU9Yf8TbUkZpZotnthOEtjPE3JeJS5w7HCPBKAM+vAaMyFquTV0
 idSZnw9IgIXY0rTQa15R1R1kdQsPGSfhARTZ3et00Ogi8SXgx8KpRCg8a3hOjBkXbGH29qruqCO
 TwuyHnGL6L5gCqtFKxhs4AHdu5UqISTaWMqiVp8a0MdTyw1pYo9956HLbSs6fBkGnpo8jtGw5Dg
 41AswyscVWuH/Vav1842px68H6UQNIP2sZaKVXbxWI4zUgvWINphQNIpPrTRuWNDbBizuwNKu02
 ew0Uk09phEmP0CdgGI6z5ceHYMx3TOgsdbg=
X-Received: by 2002:a05:622a:190f:b0:467:5eaf:7d22 with SMTP id
 d75a77b69052e-467a57f6742mr48219431cf.10.1734214879198; 
 Sat, 14 Dec 2024 14:21:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbbI0TFGIG9MLv/VjODWxI/PrwN18PfiNaH3L6SpMQngv2rPDHw6DYFqdLdXrWXvc+AGYizA==
X-Received: by 2002:a05:622a:190f:b0:467:5eaf:7d22 with SMTP id
 d75a77b69052e-467a57f6742mr48219191cf.10.1734214878829; 
 Sat, 14 Dec 2024 14:21:18 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652ae124asm1383487a12.40.2024.12.14.14.21.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Dec 2024 14:21:17 -0800 (PST)
Message-ID: <d09097da-a07a-4dfa-9c0d-567b329b64ac@oss.qualcomm.com>
Date: Sat, 14 Dec 2024 23:21:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20241210031545.3468561-1-quic_jiegan@quicinc.com>
 <20241210031545.3468561-5-quic_jiegan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241210031545.3468561-5-quic_jiegan@quicinc.com>
X-Proofpoint-GUID: RbI4zyUG4Np-VVrAdlo5JqRIh5h2ICc3
X-Proofpoint-ORIG-GUID: RbI4zyUG4Np-VVrAdlo5JqRIh5h2ICc3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 mlxlogscore=918 phishscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412140185
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jinlong Mao <quic_jinlmao@quicinc.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, coresight@lists.linaro.org,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 4/5] Coresight: Add Coresight TMC
	Control Unit driver
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 10.12.2024 4:15 AM, Jie Gan wrote:
> The Coresight TMC Control Unit hosts miscellaneous configuration registers
> which control various features related to TMC ETR sink.
> 
> Based on the trace ID, which is programmed in the related CTCU ATID
> register of a specific ETR, trace data with that trace ID gets into
> the ETR buffer, while other trace data gets dropped.
> 
> Enabling source device sets one bit of the ATID register based on
> source device's trace ID.
> Disabling source device resets the bit according to the source
> device's trace ID.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---

[...]

> +static int __ctcu_set_etr_traceid(struct coresight_device *csdev,
> +				  u8 traceid,
> +				  int port_num,
> +				  bool enable)
> +{
> +	uint32_t atid_offset;
> +	struct ctcu_drvdata *drvdata;
> +	unsigned long flags;
> +	uint32_t reg_offset;
> +	int bit;
> +	uint32_t val;
> +
> +	if (!IS_VALID_CS_TRACE_ID(traceid) || port_num < 0)
> +		return -EINVAL;
> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +	if (IS_ERR_OR_NULL(drvdata))
> +		return -EINVAL;
> +
> +	atid_offset = drvdata->atid_offset[port_num];
> +	if (atid_offset == 0)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&drvdata->spin_lock, flags);

guard(raw_spinlock_irqsave)(&drvdata->spin_lock);

and drop the unlocks

> +	CS_UNLOCK(drvdata->base);
> +
> +	reg_offset = CTCU_ATID_REG_OFFSET(traceid, atid_offset);
> +	bit = CTCU_ATID_REG_BIT(traceid);
> +	if (reg_offset - atid_offset >= CTCU_ATID_REG_SIZE ||
> +	    bit >= CORESIGHT_TRACE_IDS_MAX) {
> +		CS_LOCK(drvdata);
> +		spin_unlock_irqrestore(&drvdata->spin_lock, flags);
> +		return -EINVAL;
> +	}
> +
> +	val = ctcu_readl(drvdata, reg_offset);
> +	if (enable)
> +		val = val | BIT(bit);
> +	else
> +		val = val & ~BIT(bit);
> +	ctcu_writel(drvdata, val, reg_offset);
> +
> +	CS_LOCK(drvdata->base);
> +	spin_unlock_irqrestore(&drvdata->spin_lock, flags);
> +
> +	return 0;
> +}
> +
> +static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
> +{
> +	int port, i;
> +
> +	for (i = 0; i < sink->pdata->nr_outconns; ++i) {
> +		if (sink->pdata->out_conns[i]->dest_dev) {
> +			port = sink->pdata->out_conns[i]->dest_port;
> +			return port;

Return sink->....

> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +/*
> + * ctcu_set_etr_traceid: Retrieve the ATID offset and trace ID.
> + *
> + * Returns 0 indicates success. None-zero result means failure.
> + */
> +static int ctcu_set_etr_traceid(struct coresight_device *csdev,
> +				struct cs_sink_data *sink_data,
> +				bool enable)
> +{
> +	int port_num;
> +
> +	if (!IS_VALID_CS_TRACE_ID(sink_data->traceid) ||
> +	    (csdev == NULL) ||

I'm not sure this can be null by the time it reaches this function

> +	    (sink_data->sink == NULL)) {
> +		dev_dbg(&csdev->dev, "Invalid parameters\n");

dev_err?

> +		return -EINVAL;
> +	}
> +
> +	port_num = ctcu_get_active_port(sink_data->sink, csdev);
> +	if (port_num < 0)
> +		return -EINVAL;
> +
> +	dev_dbg(&csdev->dev, "traceid is %d\n", sink_data->traceid);
> +
> +	return __ctcu_set_etr_traceid(csdev, sink_data->traceid, port_num, enable);
> +}
> +
> +static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
> +		       void *data)
> +{
> +	int ret = 0;

Unnecessary initialization (you instantly overwrite it), also below

> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +
> +	ret = ctcu_set_etr_traceid(csdev, sink_data, true);
> +	if (ret)
> +		dev_dbg(&csdev->dev, "enable data filter failed\n");

Since the this function returns an int, maybe return ctcu_set_etr_traceid()
and let the upper layer throw an error (also for some other functions in this
file)

> +
> +	return 0;
> +}
> +
> +static int ctcu_disable(struct coresight_device *csdev, void *data)
> +{> +	int ret = 0;
> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +
> +	ret = ctcu_set_etr_traceid(csdev, sink_data, false);
> +	if (ret)
> +		dev_dbg(&csdev->dev, "disable data filter failed\n");
> +
> +	return 0;
> +}

[...]

>  enum coresight_dev_subtype_helper {
>  	CORESIGHT_DEV_SUBTYPE_HELPER_CATU,
> -	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI
> +	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI,
> +	CORESIGHT_DEV_SUBTYPE_HELPER_CTCU

Please add a comma here too, so that future additions will be
less noisy
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
