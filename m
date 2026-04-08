Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPYBNUfr1mn9JggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 01:56:55 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B473C4DA0
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 01:56:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 157DEC87EC1;
	Wed,  8 Apr 2026 23:56:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79AB3C87EBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2026 23:56:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 638Nbhfq1071849
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 8 Apr 2026 23:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=qmJZs1lr4C0E/fyx8Dm8giF+
 ilmdDMzXxhoS6JFYuJg=; b=T5Znmiow8aV0pLtFY3M04bO3SGd752eNVXvZpbvT
 WxNPIFVr0nzhrI2htN6XTj4qQ7LpxHVZ+hf6fexlGVBQQcS6xi5p/6z7PN0a4J3G
 VqKM7D9WNdhUQPmEU9bqj7YuiVSEH6zO4XzpPU9MTyXdHk+hHFuJWjf3m1TEHi2t
 SUXxRsOiX7FI0qmZKQMiq6w/Eb8BvOd2Th0ZoNNhaBLzSHuTorRMeHsTZeMPEu42
 YBWP2rN2SPInSEXShSDWskOk91zEfAqfLQXJKatg7PqMvnF77He9wtFalEbqaOG3
 9sV2Fl18Q3YeTLj0qJq2U3NoxnKutRb+kIFHxkLBnUD/IA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtb39kws-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Apr 2026 23:56:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cfdc479f68so30460385a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Apr 2026 16:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1775692612; x=1776297412;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qmJZs1lr4C0E/fyx8Dm8giF+ilmdDMzXxhoS6JFYuJg=;
 b=j7k669FOpF5MTgKzrubVK43ESGumcC08UuonyCoGKS8AcaPnB+PmftW0BcVOclk26q
 rFhQ+O8TZx/a9Myqy+u3PKzWYmx23DBEDIr0aUk4YR54XyUwJB90Tr9/hPluvmFhnzjn
 ij3ySjRQ3Yjs+f4U3oYaHM5KOGOf12iVtfS2Ae4AaiB7E0gadzYx5VEuE6A1+GWDzvXB
 V/G99YW+tifMyjVbO5MocrZkeYNlZ3jN/4hGRdvyHApMxn4ty2aNK1xMdiCwwoS4KPNp
 fxldpjY2fQGLfuN/cLJhJNKTD1S8zDEK+jWD9HtsNl+Bfyrb0cXf4nTkRkK/nNOPmZaC
 ZLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775692612; x=1776297412;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qmJZs1lr4C0E/fyx8Dm8giF+ilmdDMzXxhoS6JFYuJg=;
 b=dF7X8hYuYuhJFRmlCiawEOsVVRVjCi7BfH3vZBZq6Ec8wLtOIZhDL0i9ripLoAagR4
 qDULi5pGBTZ5pX6vYW3/NYMCDYUz4jMJE/a4COzLCE80PID0/pi7RSN42H1LJQgarQ/r
 tM5WoRgo9e4qSww8quNoVch4V+unwS0x39gGL+QzPe7mrKM+fUGG30BSlTYD345eXRiM
 DUhfMi5EOg2sWS/ggJ4GnA1qbbOP/PDgixmUBtMaoLXxyaBrgHC86zWVHarzSaTipxD0
 XdV3iKAfmVCtZhTkHItimtdDuiZmYeVFL/9GKlul5mDrKugUTEbQ0POd0NVmQ6/Fr8ox
 5Gsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsDtBpX+AXhs2pAKpphskdWakR8Mb/Rxn4+csodV2PPRv8auDx2+Seh1IjC08OkB9LJJuHiyD6La1L1w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzQblrlZ2pZc2VYUnC067j2U4IjGr/c9nrVs2VjqnrqVWrCTmJU
 LMlBIyxnioajICZkS2LTdqG86AVxQAryZvOJfUXw47wVPOTwpA0eqlC7U+DDjm7qM5V4XJhCHYD
 BsZEysON+GcuNq/9WiZsms6GJAjD5Nw6et0WAIKpxQrFF4ceE/5bbJDUZxdaZwewZX5wa9lyVgb
 ln1NgYZrA=
X-Gm-Gg: AeBDiev1xPV9tGIY61LCG41dvpWiL/OLcIEzcxs05ZnUM1/XxYJnAm5o0+Sex9c/tBo
 B5KDb3vu3xmxjVZzvG3uhOqAWNofzEEhlEe6r9d2O3TOATMGNRDto3S7L21k5l0H78aetkd91fY
 aqughsKGnmMUj2xTyhT7qlYVCnlJFvMf6c33uBNNTw8upt0CXIvEgdnra7AY4ax2djD2Sw0nW3+
 5cS1aEFEo9V0TgIp6UefSzCWjMsaTxtYJJh1mKFD48svlKrCSpoMU3/eJOWPrZx10Op379xNomh
 rE/Nc9eR0MkLmOgxhU4j5zRQQKM8jYSvE5V+PAMw1ociKocMsmRr6w17k7oMwuAVzFyOSKUanz6
 fj3YYizVW+mHEQnVs5QV+770Prwf64FSJsb1y3WVKuV1zcv46L4Gj+xhC5Hs6gJVeZQqVb9dAHX
 FG3yab29RD8m2/zGe/H5OKwIbs6RnNSJ5n6oE=
X-Received: by 2002:ac8:5889:0:b0:50d:80ee:3962 with SMTP id
 d75a77b69052e-50d80ee3b4bmr270166071cf.17.1775692612252; 
 Wed, 08 Apr 2026 16:56:52 -0700 (PDT)
X-Received: by 2002:ac8:5889:0:b0:50d:80ee:3962 with SMTP id
 d75a77b69052e-50d80ee3b4bmr270165691cf.17.1775692611794; 
 Wed, 08 Apr 2026 16:56:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a2c6c9517bsm4981220e87.15.2026.04.08.16.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2026 16:56:49 -0700 (PDT)
Date: Thu, 9 Apr 2026 02:56:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Message-ID: <fkov4nsg2ezs3t354t6llprxymx5jolqce3wxewqwzre7gn26t@lu5xtuliqq4b>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
 <20260409-stmfts5-v4-11-64fe62027db5@ixit.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260409-stmfts5-v4-11-64fe62027db5@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDIyMCBTYWx0ZWRfXyQiGr9BbEvXr
 K0b1VHOAvHTYcvLEqy8MHfcs7KwByMWW7UK2Bf/LAKZKKi7veBU6TNxVzFg0q1ebtTsLfgYJjUv
 2Q8nPqOfk+fqqEA9v0E64czMztUAGOK//03gEg+J+XuPvWu97eusPvgI9FiG+IXcu4tZr1Yti6t
 X9WLdBEe+eJuNlLpc6h2cJy/KkzfFhC3k1A2/TZ5Kyuj0hSN43dWcHd3PRzMHWD2RkPVTr+l0Rz
 0DiDin5WJA5kkGhZIsEqTAT9r7XZvSkt/98lu2OSgx87ttC5XD68E2bU5Lg/9H80KMQs2Qv85pW
 JZmpC8zQUr2qjuTozryrnfftlO/J0n/CBc/TGXzbXjMsPKzc/9WekwFteS9JVpqs75p8TxZ5nhv
 iQ72Zam/RYZrTZfm0r6R13Bta+8jge0n+CJM1+U9d3PU6TOpTHFs7N0DtDFGP5kVR2Wre2vL0Zm
 +jZ27ALmPgwY9v88r2Q==
X-Authority-Analysis: v=2.4 cv=eKIjSnp1 c=1 sm=1 tr=0 ts=69d6eb44 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=B6YNfTnrzVbQWA5GCYUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: -GuuZwRnuEgUMmFlkRQZ85umRFdTbgN7
X-Proofpoint-ORIG-GUID: -GuuZwRnuEgUMmFlkRQZ85umRFdTbgN7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_06,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080220
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Petr Hodina <petr.hodina@protonmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, phone-devel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 11/11] arm64: dts: qcom: sdm845-google:
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
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:rydberg@bitmath.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:dmitry.torokhov@gmail.com,m:krzk@kernel.org,m:linux-kernel@vger.kernel.org,m:petr.hodina@protonmail.com,m:mcoquelin.stm32@gmail.com,m:linux-input@vger.kernel.org,m:krzk+dt@kernel.org,m:phone-devel@vger.kernel.org,m:konradybcio@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,bitmath.org,vger.kernel.org,gmail.com,protonmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	NEURAL_SPAM(0.00)[0.689];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,qualcomm.com:email,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 67B473C4DA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 12:15:54AM +0200, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Basic touchscreen connected to second i2c bus.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 19 ++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi  |  2 +-
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
