Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DXtGPQuFGqUKgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 13:13:56 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 120845C9CCC
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 13:13:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0E9BC5A4C4;
	Mon, 25 May 2026 11:13:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 645DFC5A4C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 11:13:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64P7QO1Z3063427
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 25 May 2026 11:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1c/8HKj+BHzZE5YaarXghzDZ
 Q9RCYcyLQSuiliCSSg8=; b=i5Gfb5//OFq2kUm54IF3leCGsAoRElFaOmqzTqHE
 4LdtnZmd/ImQSr30gS/SNbn+Dp/cUywi/+Mf7K1rMAcXzU1A7HLlx5cIpHhLn9pC
 JxGVl5a5sMslXTuiuyjFswNF1MZkMPGekUGZ+1QV+e1CtTprcBICJyMDHB29wlFV
 ZJUyLUt6oS1tVc6U5N7svrc/Aly3z8dgck8ZM7OR4t98HW9rAWStQsJrBGby+qog
 XimCGYGLkeFSXEg/Tk5FoqKe2If2mthXyPGkHsDv2DULtWBp1YThMgS3n3DijFHU
 Uyrhsq6iuadSl0OqK4daKp4OPCxaFv2BvA/dRaq7Er6cFA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecj1ggukt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 11:13:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-516e0846095so40718591cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 04:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779707632; x=1780312432;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1c/8HKj+BHzZE5YaarXghzDZQ9RCYcyLQSuiliCSSg8=;
 b=ASiRrcR2PKUkWzauaBuydg8DeI8aVeyHPWFt+kPLPIj/G2+k9qbYLYHFoG92qq704j
 0f00mEi+/7R26jvbav+oKCMLGG/54s1lWF6lC9k9te2gkswxMLFWjgjXqTa6RyxTn7Aj
 1zSch5xrAZxDd0bwS4IoF8b/Dnih+7T3P3zcsP7fYKuIigaDvxINxbr9OMu5mMO9G7Wy
 OreKypRqNg7EQeIdVO65P6H02mINDf9RhUBwjPDtSzzlKzV+nxBs2fgYC+OrVXF3bIEs
 c7BRCCVnAjNaV0I0h2fg0jAORMpFIkI8EOGA/vIbCbVeuiO6QRme/m8m5R9qOwO1f4xe
 9xRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779707632; x=1780312432;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1c/8HKj+BHzZE5YaarXghzDZQ9RCYcyLQSuiliCSSg8=;
 b=CUnuwe9vHYviJk12/7XrTcj+1n4rDL0Z0EFU8eRpIUGIRwPWljDRFEit6DNmLBbFv9
 MJwZIIgxsWNIk1wXkolgJSGQPkZCg/64zq9xLF4oM/XhooUKqAuU9q3Ps7gikrZMrbeU
 tC7Tck3MjgL2tXNm1kzSOEQHh2YQTiDnrtq82MGEVuFCdQp3gXA0tcd2D6cBh6liTpsM
 FbJT9Wei99JDMxFR9qSUZ6Lh1z8CxciioBPAg7LZRXLaQfX7k5g8kNOHIh5P4HG0+q0I
 0Hc3OyNjAlByNoNl/i1+Tp1iSo4NpQtdaBbDS9RERS45oQi21wd4oOrlyzEuAx62PDPl
 uzbw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8/iGIDJ9GLVHpedjFKP2BgzfsU2jbth5vXT6t1f0ZkRrIKKGXw6LdYQOYBMtI7cC94Kr60lUMx6F7YBg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwytRHVuJBIS/COoA04iCJ6kRaq/e36BDqCJ1/jsrAmjqHPy2v2
 m2j8c+n+PYNThBz8z+iB2fYLOQcb30Beh9CzjaJvwEtL7hKeAK+K0txJHv3IkkklRWFK1uKNqR2
 OKBtQQ9Z/MNkTD1blR56nhFby4FTWYrggkH3+jZ/0bKFEzmRD86ZUEQdVDnD0lUZIblpmZvqako
 s5EMkpFMQ=
X-Gm-Gg: Acq92OFLjtEFoyh8oAMQ7A4zoXws9rO+zCR3BkYIiVQn3oIASrwqQKBfhVtFm3jOB1O
 rkbf8B7DZ2FrWPvV8vQmOt23ABuV5OHVkHsGd5VpWpvk5qCNQdVQZh6OqDO+/dmUmcwDuInmSzo
 UmRUS55XI62aZVL5lOzYGDeejAPtlOefHtSXsKjSKvbqJZ0lq54WA4SFHQrk/3+/CP6zP+smrf1
 fJk93YdZuxQlzSNXDRpBXEu4TUEHGWhNSCCfmlPKcdznl17B/east6TQ6GCDHXwspN6zUNBh598
 8Uz+UcgTCXI4X7nbv9FTWh7gfHomdpGTCRn4dN/FKU4D6t0RUyaTiBR5uOW7BVZpqOYVWp8mVUX
 BHFeKG6OG3AWHfyBIoeOhqARPiG7ps1BDIqIjguaLD9sz/HVFzfYgdPb2ACvU9KEBW74mAXYN5W
 q+ZojArkDwY+oxAQOM0gr0pUq+eqXmddPE/6E=
X-Received: by 2002:a05:622a:2513:b0:516:d4b1:48cd with SMTP id
 d75a77b69052e-516d4b14c3amr180285741cf.2.1779707632296; 
 Mon, 25 May 2026 04:13:52 -0700 (PDT)
X-Received: by 2002:a05:622a:2513:b0:516:d4b1:48cd with SMTP id
 d75a77b69052e-516d4b14c3amr180285331cf.2.1779707631854; 
 Mon, 25 May 2026 04:13:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-395dca7853esm22973391fa.14.2026.05.25.04.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 04:13:50 -0700 (PDT)
Date: Mon, 25 May 2026 14:13:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Message-ID: <u42lv62h7ps35zwqzxxmk727rmnd4ql4zmhb65q4bkjfwhi4f2@ihis7lc7zm62>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-7-a1d125619a5a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-7-a1d125619a5a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: i47pC1Yor-m8OC2DTm7XC7ZxRJEONI_a
X-Proofpoint-GUID: i47pC1Yor-m8OC2DTm7XC7ZxRJEONI_a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExNSBTYWx0ZWRfXw0BvYcPHgI2E
 htzHwS35tR+RbTku+CV1EnBQdPnQqUIFV9go74GRLLlWpVWGdxGUTvNrKU8U/eLTwS3jXQydtor
 e4AcuRboA59em2tv5YVpczom45208va+2xTH5rvDAQsrwLRTcCOz/qrmxsI7f55Tw8Cu5qG6KXi
 C8iY+H0T+6tjQa8TlIE1Ea11sBVoqTfG03A6+9Vqq1WEa9b8wpZPFgf36sOZ223qA/PHH8ZTOal
 PLtFC6A6yqb1FePN1I4u7xYcx4kuyoDRGHroPdX0PwY0XN7kvxIcJ3cBNhjkRWNlUBKiVbOoF1r
 c2d1srdMO8UVTrCvJQwInlXwCCzlAu9uEUqAgdgIJF8P4GilUl5ceRVAsuk2nW1tAMdm/iHKVcs
 esTmZIRoOWCox3rHI5xPAc5APeMcblqyUul7fZ7r9/aw34OM853drtp6yWasEq8xApHGBJyDjFX
 TR2ydL6wMFAzxEKgBLw==
X-Authority-Analysis: v=2.4 cv=D8F37PRj c=1 sm=1 tr=0 ts=6a142ef0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=h40nfcmH4B8cT1TSTS0A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250115
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
 Luca Weiss <luca.weiss@fairphone.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 7/7] arm64: dts: qcom: eliza: Add
 support for MM clock controllers
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
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:imran.shaik@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:linux-clk@vger.kernel.org,m:luca.weiss@fairphone.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jagadeesh.kona@oss.qualcomm.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:konradybcio@kernel.org,m:mturquette@baylibre.com,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	NEURAL_HAM(-0.00)[-0.882];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,oss.qualcomm.com,vger.kernel.org,fairphone.com,st-md-mailman.stormreply.com,gmail.com,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 120845C9CCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 04:16:09PM +0530, Taniya Das wrote:
> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 61 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
