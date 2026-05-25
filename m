Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHbHDnYtFGpYKgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 13:07:34 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFCE5C9A5B
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 13:07:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0635C1A979;
	Mon, 25 May 2026 11:07:32 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40D62C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 11:07:32 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64P7NqSJ2211897
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 25 May 2026 11:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/5NQfF+ZUa2lq7+ZRulYI6A2
 NsYPt5ClBqhGGJ3BoYU=; b=kGi2RGmBw1JUMOoGdEou6hvnPDbPITcGo5Mt/uJu
 CRBahgR1LKFIrw/sgAokxejEB+4OK7Wsu4gDmyxuLP3N++LW/9Wm2s0DAAX+xQGH
 qGXzjDboMFXCPairiM9W8UsJbigEQORV2O1mAD/s4lKSe8UXgXvmbxa07kE0xOXV
 Q68r6KwQkuZo17+sV8NdI+9ZQn7QcO226pjtD5ENpz6qKCahEgUQLTYzVienfz0H
 8nfGnQ8pAcoTEWijFzl9EYYXwwkPURTZ9R8nBnnWithSIdpZrHt0Am3BVeS12VSo
 w7ZZKSCNEF/cb0ZVSmLJrH5vyCOnq3KO8MclI+P/e7zHtw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7pc15-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 11:07:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-63144b84f14so13311510137.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 04:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779707250; x=1780312050;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/5NQfF+ZUa2lq7+ZRulYI6A2NsYPt5ClBqhGGJ3BoYU=;
 b=cxylGqQcO+4RNjY9Z4Rih2PBiG7dDjGNPH99slX8BV/tr4eVO4xuKYKWlIxw3HkKMX
 BJanTEqz8Y2G1yQvYMMynWAtlgcXCCzPpgYS8ZPWxH4beZYfM19PFz8p3nu+IEKTf7+g
 2BBmpKL7mQiRpUHSzOjpqTNjvYJdM+C4GZqMR2bHdT4m8S/8cFu43tZSy9xltHkllXBZ
 yv0pgf7DCX8cJTTlJdJKTI47/txgykh5vHwrwvDX6iblvWn0ekYCtkF6H9I4hpQnfKWi
 ZTRjmdnnUJ5VyPwvR1dxcEgfisbJ9bxNTroO6SpPWhq+Ayk2Rkqh4Q0ikfim9OV8YY1e
 fnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779707250; x=1780312050;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/5NQfF+ZUa2lq7+ZRulYI6A2NsYPt5ClBqhGGJ3BoYU=;
 b=S4NaRxRoKYoFi0pnZlUddEFQMe7mTIAQLxXxoEMgMecMN5/BhnuZSFeX9kQRWVUqWW
 J+xaKZ42IOmvnkRWqrqLd8/rDLSJKOpjuuiSP0V6L2NX0myKmeWHZkASNUitkKdiVLt1
 5XfvPtvpyL0xvA9g7jl1JGJma3NZn9aAAE/alMS6JLZj9o5F/WYt2f8/6SSGVzYPpQTo
 tkk/LNu5Vf9udXMVK2RTo6Tw62ypV6/1OLQe1rnTSI8Hkt/vCkO968bfgbBaB7CE3NKk
 FSdiNeaoEXYNP8E8x2QqT9/nygy9q6Lo22uKCnGkQiXprDDvZVlRYNbZ+U4TTaGpnKAW
 x15w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+x2pmo+48SLvu4auHwgkuzKkKIvlpGUYadIHDAb0xygp5XiCLaDAbabhXLgvft3zQzlGMZdD+BWVL9Dg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxnNxxaOBeEyFytH3iu4AyS1EmYGDlc4aM5y8aRtIdYdF7wWNZ3
 y8cexVVamNzrKASZ58JOeZO7nrqI7jckuV9CAUh2ex4Th8zS+gISL/bOsHjQ/MrTKbRasABtW3k
 OOIqnr4/uEHUW0gU+7tOd7+9TzlCXeg3n+/aHsUVlMb0gJb74/ZKO3NWN6EIz3LMNBvNEgHW8qY
 Qs+fH2LXQ=
X-Gm-Gg: Acq92OH00fyU3lBY8ttxbKMQrfONR15nGkAn53Uak7/UAfEGij/YqOuqr6Ywdf3/pgp
 9b7j3Fy70U2WyS+6gFDpE6VhSMhoZWTNt83WYpQehb80IVY67didrAi3KpdOPpUkwb1VF7ivhKL
 wTSw6oNyL+naE+bydrH5W+Dzb88CeSNN5J9iOBfeo/dtNyTVtjfdeJZEt2Z9Hfli2VS/P5fqGIH
 4/ADKEM8uVETP7OV7N90hHlnMDf8Mv6n2cNyPogG2zVVgN8miI9JXGJjAz78OhgRC+jlY9FOxzW
 KEhPXslg1geuSus4uVjmpaRI+OYf7mu7EaWQJrOGhjyacgRTB835RARnq1pNWqFnUcWET49Uu3T
 fws83Kep6ExyQDCtguecl+0vb8D0NXGjiRPtfFbWnERTLBYxVfWk3oFFDjygHG5g7S7KhzKvcQX
 NdBZognrdDI2pwW6z5StTB2sy5u8Q7jt02eSs=
X-Received: by 2002:a05:6102:688f:b0:631:81d6:e158 with SMTP id
 ada2fe7eead31-67c8fcbdbdfmr6780124137.27.1779707250291; 
 Mon, 25 May 2026 04:07:30 -0700 (PDT)
X-Received: by 2002:a05:6102:688f:b0:631:81d6:e158 with SMTP id
 ada2fe7eead31-67c8fcbdbdfmr6780116137.27.1779707249899; 
 Mon, 25 May 2026 04:07:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5aa32cf96b3sm2600950e87.80.2026.05.25.04.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 04:07:28 -0700 (PDT)
Date: Mon, 25 May 2026 14:07:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Message-ID: <bnwy2srhmflo7drgavqonka7wrzbiwas5xjbabei2b6wfzci2b@62pkd4dr23j5>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-4-a1d125619a5a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-4-a1d125619a5a@oss.qualcomm.com>
X-Proofpoint-GUID: Au0RNpAwgNy9hJwBqzJafxpHGtU8axvp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExMyBTYWx0ZWRfX62TzH0lydxTA
 CKfFKDuMTIoa1YRMgZxy19TvVjlLXwCZ1U2MqeWQvRV6iGfcibLIkAhpaJl8VrL+ZQBRwsP6Lww
 SqTG54vWfLHMbDsdgnRUzHgragMbNE4dvgryqlHwEGJmZ32xWqtNIzaq9BFKRviuSdwqZMU+sxT
 VtBDHApekbmQpav96aqG163bF0Uun/LmsJvBFx62kMqi1ajjKk+uO2d9QhsBH7663LjPiiZ9AMh
 QSu9e93vGT+4kg5wIs0R7AzBejTgR1e92ivi3TfnnyamEzsWDK6cTAjFrtWIjmeJk0xZq6ca5V4
 ekmiT+BjSHGYfHx+xpbUT1Pw4tO2F2Ic2rUiPO1xMGe1LvJtULsfBfvGhs5Mb9tVbSNHcrS76l6
 9LnBWZd0pHZwdSwrC0QfJDUhnqIGESlG0m7rdemr2IVz/dUaMlbKV/Zpt5KmZPCduYeTyMPeA4F
 Hrg1BxUI9SXl5jp8nJg==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a142d72 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=d7ClhsmVZ3m4v3ji_18A:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: Au0RNpAwgNy9hJwBqzJafxpHGtU8axvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250113
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
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
Subject: Re: [Linux-stm32] [PATCH v5 4/7] clk: qcom: videocc: Add video
 clock controller driver for Eliza
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:linux-clk@vger.kernel.org,m:luca.weiss@fairphone.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jagadeesh.kona@oss.qualcomm.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:konradybcio@kernel.org,m:mturquette@baylibre.com,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	RCVD_COUNT_FIVE(0.00)[6];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	NEURAL_HAM(-0.00)[-0.895];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,oss.qualcomm.com,vger.kernel.org,fairphone.com,st-md-mailman.stormreply.com,gmail.com,baylibre.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: CAFCE5C9A5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 04:16:06PM +0530, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Eliza platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |  10 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/videocc-eliza.c | 404 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 415 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
