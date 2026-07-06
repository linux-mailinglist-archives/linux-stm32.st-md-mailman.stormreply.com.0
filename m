Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mI9RFlQ/S2rPOAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 07:38:28 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9715570CA6E
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 07:38:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=KTCjD9Pg;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=K8YPUGbq;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE403C8F293;
	Mon,  6 Jul 2026 05:28:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53119C8F261
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 05:28:53 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66641XQT3438162
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 6 Jul 2026 05:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pAV+cDxNEbBgATm6StzQPek5m2H7diNkW5DFl0AvbJY=; b=KTCjD9PgjuqwdhZ2
 6dKSeiGSFQc61DcwHTYZuiPE3Nzt6bkRKmB7JAP8kqILuOjsKUx7MF0CpIPeFVYD
 RUCipmYE7vOki3GEj3C7lv3maOv+cKsubyRLeUSpKniySdE1bexIaKJqFrrc8brS
 EYxHmUm96SPfBzgOF7MTx1BMp3B7GbQ31CJYYApMm0dK1ebt+XiZ00Pfe5aplC/Y
 77bW6JHPQDoCwyfLQ5s1pxhDw+Sjixbg7CeRV/WE+Fo4BcRHQ+jOTV4HVkRSi2Yv
 71reF6u7d+jJhq/Cmin2Xq+gh+IiWjTMD8IeOHsjYw4gZBx6jlCPQdKF8wJwZjH/
 khhobw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8mew4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 05:28:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-c916d17dd43so4183726a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 05 Jul 2026 22:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783315731; x=1783920531;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=pAV+cDxNEbBgATm6StzQPek5m2H7diNkW5DFl0AvbJY=;
 b=K8YPUGbqDrbN9ZOhOoPjfcyr5V6J5qkNVSNPy8VvqHeT+6Grx362cILQ0xBBwdGHSh
 G5nikigKO7R3BT+MqozG6ANAiHN/UaQhHCscCNARtuaLkTV+GPCwAgJC611oKYnijYAj
 olqLb/LjTDAb/y2R0B97pf3E1gY89tWwYPmxwWrDKYjKW0al+5Icp8AJK5Saf+FOsEoV
 eoMNM4tABeujHqJbI+pUacASCW9u1YokNrprDRWVYnnuMIxe/iQSVZCL7YKkk502nk5L
 HCx3RonUACGWaMWlAuuXuZZmfx0rfAfJUJ6pB05WBid+y3CIML9vEin0POo/v9lWIQ9f
 V9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783315731; x=1783920531;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pAV+cDxNEbBgATm6StzQPek5m2H7diNkW5DFl0AvbJY=;
 b=c3q49kxGGhDw5O87PuDXNwlUWuAdBwVotUdtxsfRwbzDHcUQoWCxGUV/71CyhYDQUr
 2Utk8CvLhFvkLFZXS2rqrzwWCKiAWa/gqh92GmA8FGVmqFbdoU6A4Fi4KG0RVOOmmBAK
 TChR6SMNBmqDRQ3TSGENPuK2oSkTpntIk9t5KQeezVpcEUyW9UkEjP0Q8NpszvFhcQrN
 qEmNRJd2tIMU1lR2V2K+kGxIjBVJX5PNvtuEStqUpNd+imd7hgi68Jv7RyeByW2GUw96
 CBvC/D14Di4MxWiodNUXeQi1KUidyjXOgeSokCDdlVz05PFmkjbZPj80DVSgTla8LsBJ
 Rvsg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoqX30orU1L7nssJOGqKJ1aqXvq+wZgalrVyN1SEQe/Ly2Kp2Yo+Mv5fSe14d+C+yZcmuckl/3SlRJw7Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyIzyLuif4leMJBOPt8s3i6BK+scPqEuWt+jgmqc/up6PFfFKHc
 geInBkDkyhnsc2DpB2zDYCPMzinOp1ZNe1pDSmvJy8N4znP1MD32pLrIUT9f8Tf0KejL+emtSRi
 BjehWK86wa7nSQOHlNDe8TRzR8p0JlZwcMpcUuX/W+ztFu7OOYLOVM9Tp+jb6ubCrtKD8UdFj++
 e7PBqpUsI=
X-Gm-Gg: AfdE7cnZA0s5CVKVlHVAYBMwgj/90MkCDt/ztF2NjlZA1840D82drAgkrqA7w5t62TU
 4k65ov8VxaeCS+qeR8m7SxhTtOKC/qPsj0bR8pbTC9THVZ52x1yhTvq5jvZjwhP9bDcWS8wcVJF
 JBM71nNoDoE+rHTH+qaQloFeF9EoQ8CC7Un1H1S37CtNxokPp7RI172pwBpzUbNC6RTxGv0LsY5
 IkvQ++UqG7yOQBRDPKKEAiWu1kmfg6HJZmMWazcCde9VlV3mVnCb54+oScxO1EpE8Gn8TQp739r
 MlcgnnxesS3KN6FESylPtFJSGLjUK8zfrXQ0E2ZSgBg8kyQkji/g3st5f6Dk4tZJLzuPzTObj3x
 rIDLFsQ6mNrHh9mzhKSJysI51C3U+wXlJjNZGAz4=
X-Received: by 2002:a05:6a21:7a91:b0:3b3:bf95:f7e3 with SMTP id
 adf61e73a8af0-3c03e5469bbmr8361343637.43.1783315731001; 
 Sun, 05 Jul 2026 22:28:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a91:b0:3b3:bf95:f7e3 with SMTP id
 adf61e73a8af0-3c03e5469bbmr8361303637.43.1783315730566; 
 Sun, 05 Jul 2026 22:28:50 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c9e8eb0ef50sm5875489a12.6.2026.07.05.22.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jul 2026 22:28:50 -0700 (PDT)
Message-ID: <7eaa8b9a-ba8b-4d07-92c4-3a965ad58708@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:58:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
 <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA1MiBTYWx0ZWRfX2H376j8CkGxa
 Yp/fed8z3A7Yb2zzowUiXloPrMfyr0ZLij+Qwyte1PTswYIjQvG++cRtP/Cp4OkkYv7ywuMm67W
 6/euFNFmRJfm4bImsHSGI+PYUG/rCmrbs6vpDXoK0hP1zSURsRc15RCxdBcpllHUm+ySGjcN6ze
 INBfa0tcJKfhjcnjUGZxlZnsF/UuSgLBN29eksQfPAKn5AIqFUB+94bW4qmwqAdFdN1CJ9w6LVZ
 FEutpF74wq8LRBwmUUlCsCEqh5w53hD2pxLeMpCt/cUWIJziHZl8uowh+i+0YkdKRDGo9Lig4/x
 7QTbt+HUXd6cSCC/GZBgFDuYsTiFeDW1X73JNBicgW6sd73nke/YzvGrG+z87AbKEeMuCw2EhVl
 sX5Ere2Lj8Ueavv6Ka1C7ULsxEbcTZhu3VgZRThJWd24drRZIpUqFCtRXuz8XGOYnEnlEURBlYb
 3OROr+xV6ZlduVB1QJw==
X-Proofpoint-ORIG-GUID: NQ8JzFoK9woa1n3net9GSA52kNaMe05c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA1MiBTYWx0ZWRfX+6RoHr57ewcH
 9AzOhGlwpFoBbFhBL1HgtvWFYelWqvQxnzanpP19p4McBt07+44QPb74c0gG5yJwfh9WaN6yrI+
 gvF1GLPCCtwWjwVsbNLEVrWKAz/VOZU=
X-Proofpoint-GUID: NQ8JzFoK9woa1n3net9GSA52kNaMe05c
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4b3d13 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dZunwGW3stLU1k_RaHIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060052
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 7/7] arm64: dts: qcom: eliza: Add
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dmitry.baryshkov@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9715570CA6E



On 6/30/2026 7:39 PM, Konrad Dybcio wrote:
> On 6/9/26 5:02 PM, Taniya Das wrote:
>> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
>> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> Almost all of these nodes lack power-domains, meaning the
> aggregated performance state requests will not be translated
> into RPMH requests
> 

Konrad, all the clock controllers are on CX, similar to Milos and does
not have any special voltage requirement for the clock controller.
It is okay to not map the power domains here.

-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
