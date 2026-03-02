Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +I9DNFlvpWlXAgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 02 Mar 2026 12:07:05 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E78F1D72F9
	for <lists+linux-stm32@lfdr.de>; Mon, 02 Mar 2026 12:07:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B487C3F945;
	Mon,  2 Mar 2026 11:07:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA672C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2026 11:07:03 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6228HHVB3223969
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 2 Mar 2026 11:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8p5W6PTajQxRRdBVXun2ntjArNqAZvNR3wDMgU+v+Nc=; b=OfEe3/Q3k25ZMdzD
 M+qtpADaKdb1/139SeHxGM7YsjbNJd0aa7ZKuuMNt9JoowXlp2icMAKzde3NiXXG
 nqDg3bXfHo7Qzu2CHmKP5dhd0zqToN1aBK0o83dmGahBQ4uU05/QD7crkFmakKyb
 kvS0K+MvV268dzEr38QXpneaMGR7mcvaIkKPQwupy9K/YMK0wvtEmhqd8ITbI1ew
 3n1UmQz4jSNihqjgXTWUwiMsnIJPGVZnNQ79nlBFQv1fpWTFMEFJswH7SBy2UR0+
 YklhYy0BDeA4pPEGXoVZTwxja+Ggz7JOmI9RtMcNmtoVrvlbwyF9B2QxWXneOHrf
 T2vOIw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn0b1hvgd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Mar 2026 11:07:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-899f6011df3so5718546d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Mar 2026 03:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772449621; x=1773054421;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8p5W6PTajQxRRdBVXun2ntjArNqAZvNR3wDMgU+v+Nc=;
 b=dpTgpGpov1+I0ihMi/JXRn3zVpP0nR6+mC7nTvF++3p06RX9FhGoXa5bNW9CWOUOJM
 wK+OBQ7iZeELjhhdkCGSmjZm+xJ5NLte2zBxvccXKYt/z0DEUrWtJzT/vSLdkozKNlLm
 wNy24WVE83ljl9ISjUE4DhohqCbKDJysCPi6+pjtLp7zo3+wwhYPtOubGtiRSKp+Hf0P
 dUC+XW1P7vd1ViypyckE1R9mTNvU/UkmDxPHoOMJ+AoYI54cdkZbf/oICz+BY5F4F/J6
 EFsv5MjRJ3xauPdnmWLSR679R0mMT5ANJmcBEwf3B0AErfUL2vsVZuEL0Mcoka0Hxy8e
 y2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772449621; x=1773054421;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8p5W6PTajQxRRdBVXun2ntjArNqAZvNR3wDMgU+v+Nc=;
 b=kWqahQolUncEQiJ/0NxIG1oCc/IUJ2CnklwMCwXIyKtDTSd558JFkVMjK+G0yhgWn5
 QgqFa9/JefCNoJ6xT4nYSPa1wqmJY7kn3m4kvHB7AV/h7lagpRlj2Yxsw6baYEby9rYo
 rcM+kr/NSO5kRvjhqbZ8UBVD+VisHsH0zJn2Ix431cfBtGtmSILeOOBqeNx+rqiHr5zJ
 01b9Gu9B1E1vYKC/EaVvDd4v/U6xGhIuxq2ZTByUsloUK0EMSP5XBUWME3XMMGwOfbu+
 UqL2O2c1gHZeJCXUjSgcZel1y1teQdBNMw/61vjFpeN+zRkLnp5yewIyvZzNR/W0dGjG
 NHoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPnapgJOXujn0qqXDf+goEAzLKPQObgszfClHXxKDlxSUZkLAd0f/ADyJD2jXRcnciRgY+jAc9H+O/Nw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzR/+TOfLy1mp/lvJOFAMKYACaP+T9cWo7SLPQ1WGw2RQLi+07N
 NWZ1lAy0zJadyrrJJS74uIe9l77voMZyXZ1pHMNUikK41o4AjI/d/Ds++zb88Lu182fYLZcZzPc
 JI9/1aQY7+VNrn96LtPvIbl35ICRrP6JCByI7w9yaw+cRomAmcckDqlzr/hOghpw5036uorEM2l
 GvTugYjSo=
X-Gm-Gg: ATEYQzxO9yUGjS3vOeQlUvamAd5G1vZVdouXtjgFXuIT+DWflnl3RMqhExLlzBPMN9k
 3q5smtQ3l7sG/9k4mmeK4f/EDL6qIbmFRv+bZJxdjvzIANKBV925A6KwVPlvWWe82QdGGTr8seg
 jaN8jMJaRKr/Enf0EtG1Yquc+lhMSKeBcaFBRCoRARXamKoaBlQK+jL6hABftfjAADMyt/hwu3w
 oMUAeLgA+2dLRN41RPe8Gun6Ga28apAPrij0Wl1cBzJ5xDCBZ+L2KTxVLlBBMRHNsRRSUL/JQZE
 D8Ee5yA26QcI7iIBI0Q4iLjL0wRQuHPChAeyiiocUvcanMy3vNj3lmLb4bgIdDTBc/afEYz5oa7
 csOuSLLCt6wjGYixxQS6YD9QwTaj1EAxp2jrSOPr7MOvIzOw+S1ryX39wx/wiBPvcUY0gC86/G/
 e0+Mw=
X-Received: by 2002:a05:620a:4004:b0:8c7:1b40:d096 with SMTP id
 af79cd13be357-8cbc8e79d8bmr1105602685a.9.1772449621116; 
 Mon, 02 Mar 2026 03:07:01 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:8c7:1b40:d096 with SMTP id
 af79cd13be357-8cbc8e79d8bmr1105599485a.9.1772449620636; 
 Mon, 02 Mar 2026 03:07:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65fabf6cfd9sm3331067a12.22.2026.03.02.03.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 03:07:00 -0800 (PST)
Message-ID: <b747b545-12c7-4e33-95ae-ffa114fa13ec@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:06:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-10-22c458b9ac68@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260301-stmfts5-v1-10-22c458b9ac68@ixit.cz>
X-Proofpoint-GUID: aGfu0ep6D2c_w5uzNMDQC06z1n42jtHb
X-Authority-Analysis: v=2.4 cv=Hol72kTS c=1 sm=1 tr=0 ts=69a56f56 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=sfOm8-O8AAAA:8 a=8wVjoaYgGRnUAGDsoUAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: aGfu0ep6D2c_w5uzNMDQC06z1n42jtHb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5MiBTYWx0ZWRfX4PC6Ajj0KxHD
 7lD/u0CT307V7enIiOQWjGWoXAG3ji//GQgB5wylcjk+uxzzRyJdKEb6Wqvu2wq32nl03qFmw6b
 us+Y2ApAaKlIdXoP3Nbm2LWKMhn784pxuIAXRfroC/7lIE5wXpXi2YYtQVIcs1XuAKRv0GpKAWz
 W/ljzhchWMnDpYJQbw+UHLJ/CzvMU08DBQAxLxs6na2ezQgwJfMLBa7lc6kmpbVJ6IQhbi2cmMx
 +yzslrAC7QSNJ9BukWpKNmxQ0oByX5RMZvlhA6i003BO3GCzDkpywEcrEy1C5jj6YFgRYu5s44e
 scEBvFB8KVkZaImvEipSefj6QdMJfpTTwzJQf5+t7SaXT9OLP9meJo3iVUwwVGiWXsySAU5xD+p
 nvY1NjFmTHiyTho0VOeT5BKBzKskr6L88zw7zxZ3jlw7AdWpmxsJNoBbt/NuVxF17AG2Mqe0cjK
 4f1zegscqKI6SMi5tLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020092
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
 phone-devel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 10/10] arm64: dts: qcom: sdm845-google:
 Add STM FTS touchscreen support
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ixit.cz,gmail.com,foss.st.com,kernel.org,bitmath.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:dmitry.torokhov@gmail.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rydberg@bitmath.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:petr.hodina@protonmail.com,m:linux-input@vger.kernel.org,m:phone-devel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dmitrytorokhov@gmail.com,m:mcoquelinstm32@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.698];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,protonmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,ixit.cz:email,stormreply.com:url,stormreply.com:email,0.0.0.49:email]
X-Rspamd-Queue-Id: 6E78F1D72F9
X-Rspamd-Action: no action

On 3/1/26 6:51 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Basic touchscreen connected to second i2c bus.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> index fa89be500fb85..2501104b06e1b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> @@ -26,7 +26,26 @@ &i2c2 {
>  
>  	status = "okay";
>  
> -	/* ST,FTS @ 49 */
> +	touchscreen@49 {
> +		compatible = "st,stmfts5";
> +		reg = <0x49>;
> +
> +		pinctrl-0 = <&touchscreen_pins &touchscreen_reset>;
> +		pinctrl-names = "default";
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <125 IRQ_TYPE_LEVEL_LOW>;
> +
> +		irq-gpios = <&tlmm 125 GPIO_ACTIVE_HIGH>;

This is an anti-pattern - you can translate the GPIO handle to an
IRQ handle, but unless the hardware is spectacularly odd, an interrupt
reference is usually what you're after

> +		switch-gpios = <&tlmm 136 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&vreg_l14a_1p8>;
> +		vdd-supply = <&vreg_l19a_3p3>;
> +
> +		touchscreen-size-x = <1079>;
> +		touchscreen-size-y = <2159>;

Are you sure about these off-by-ones?

FWIW

input/touchscreen.c:

touchscreen_get_prop_u32(dev, "touchscreen-size-x",
                         input_abs_get_max(input,
                                           axis_x) + 1,

				            notice ^

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
