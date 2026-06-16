Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QHimHmscMWoKbwUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2026 11:50:35 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 041A168DB42
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2026 11:50:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=CbxBq71T;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=kGmvJrIf;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 911B1C8F291;
	Tue, 16 Jun 2026 09:50:34 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC146C7A851
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2026 09:50:32 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65G671Ug2894249
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 16 Jun 2026 09:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NQiZZvuAbKBvUjZbZVVninjgYcEiugRsy2ygB3ZkJGs=; b=CbxBq71TeX+Ekoak
 Lr+ynkoEdj1zcqidsrSn38QeNLWeGOhqyeLtPPjgMaB2R7oPqTHWJYcZLW3g5Zrf
 Bezo7TbiQ7gA9HopG3BD240GOrzcfZuqT7DI3buVjY4QRP2BlezHoorSJZGSwR3q
 luNynNWBCKe/zxxZdDg4E50cctV5BU4udfdG54GgR60x1tI/vy8vTLAhRhpsnDL7
 XyZKFran3CkRogVc2cBZCFg5MEg5EfU1ARnuWUXtYhB9RtlvBaZPRCJ/s3EAeSLn
 LM+xmccP7Nq+UCBdD83Am2bCRq2EKl7LAf6Gm/zYP7nL07hfelo0epnkHJrUrRIy
 +228jA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etgvhnkbn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2026 09:50:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9156dc90fdaso102198285a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2026 02:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781603431; x=1782208231;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NQiZZvuAbKBvUjZbZVVninjgYcEiugRsy2ygB3ZkJGs=;
 b=kGmvJrIfWmONwLGdFPoqXKe2gCAWd/2ZXIXnsY9dMi0oAZfenF1fnhQj9fehI9Z0mJ
 t8uMtehppg3fsG6V2Ytq461UvRZFS1ku1Xt3yGONBl8VTpQ1pRiv0wi2GNidrs7ZCaIU
 KFuMF8zWtRtmekf5UIkYixSwz7PMgkRGsOZCQytIST9y6Yb6m2SeF3sC4vVoqFwSRJkz
 oC27LYwPd0eHbBqAiCgIBQGZRtQkydRbWltMeNJDJyjFlzIZc0bH0NV7Rd+bGfdjiGgO
 iztBN4qlM9ZdgdXfsF9/bUsrwzACnFLnwOgQRl2hIG8nUNNWoEwmWtZPqMJi4yX6YMz0
 qixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781603431; x=1782208231;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NQiZZvuAbKBvUjZbZVVninjgYcEiugRsy2ygB3ZkJGs=;
 b=cZ3e2Q7IwjFVrWAKyplrAdd1NrYX45Aez3MIBpsDHrGNdmLBjd/3RX7ryyYodfLAjh
 ygHaayOie0Sq9f8BNSuE9V261n8PVFjytGoosVC4JK31wAtCcM+fHY7UzXc2nnw7+45r
 POcFpnrP7XOJGjZwbbgLMbXxwdeEpsQ4DXNo0vhLyoTODW7V/BuQOByVuAO+/aPoDGBV
 ee4TfZSe7RvGeI4N4Vevw9QbBf+Ak11bM1VogghIpOTE7GV/jO9CLSUyubxON2rHFZpN
 MKLBPG0s2e1uuyqiTGTdFSCj5VPXlWHTNfTlkuuMGG3ThZGs5PvEODj8GXNsZQl+Dr3R
 lTkQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+k3v+sISet5RizwNvRokFw5lV1FvLUB67jA3R3CAq1zwdlsfzGlf6m7C6LSOZSSIRCG3zkVb1kgCWi/w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxIBCP7u0UrwnOZrXfRseZItMJkyKQHJ+v20HKd8hfk2aEi7PJh
 Qe++FDjM+GIdBGuQx3ToaCLpNKeDNg68Nftyw59a6IYMBQmx3G++FP9ToYzaHWrqQI9px9IjlyU
 kHyuCSZiyPxCrQ97kbZK6cEE1OH2BLA7wjAqi48fYBsxLbTUzgG9U0NrEw7+11GlwMlX3gSCMcd
 mxySThSik=
X-Gm-Gg: Acq92OEI5yiShWwgaosSYVhfzho3ppTo9Vo04Sriw7iQjjUffCwdVJD1sqTbVbo/SPw
 C44kGPGKxQGdx05Q+eezyT/SlG2NmSR06gF3LdXym6gNwe0WoIQofbW2dTW8KmsFKK3GpCRh29N
 Zw9nY+bTnxmA3wDStj3KpbOLZy1F+BKYheaiGdR6CDe/YT2Ee+ZssUSbpQ3GKQc/VAVBfWNx29g
 HnzernnlQQ1OKSp5E834lVy1t7taacYD6MYUuCg+qrckEaf/nnEtqsK2SwhE1W0Tf5MvoImTKlO
 x8lWASp/C0jyD3mCjDivEtYdfmY5yAPB80vVG5EMQS0AZBZU8DZOhDj212xjAIak/zYQ4311t5G
 1r5uI0cZg6PtqWJ0f9QE6E33f4h1r05EXWH5jR5cHPm2AWQ==
X-Received: by 2002:a05:620a:710c:b0:915:7a64:cb68 with SMTP id
 af79cd13be357-9161ba94318mr1786718085a.2.1781603430969; 
 Tue, 16 Jun 2026 02:50:30 -0700 (PDT)
X-Received: by 2002:a05:620a:710c:b0:915:7a64:cb68 with SMTP id
 af79cd13be357-9161ba94318mr1786714885a.2.1781603430509; 
 Tue, 16 Jun 2026 02:50:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfdb4b22136sm630904566b.15.2026.06.16.02.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 02:50:29 -0700 (PDT)
Message-ID: <2cb658f3-f564-4396-884d-d025eaa674a1@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 11:50:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-8-f0f4a1d19929@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-8-f0f4a1d19929@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5OSBTYWx0ZWRfX2f52VZj1g1Yk
 NDUbyQEYILFiMrrKEBZOZw95W3zBhR6lLClvoeaNsbVMEpoHOlY+dblmMLXqU/XBueaPUVGUg5F
 kppYE6WXCfis7qcm7q8rqHTStTjnb2s=
X-Authority-Analysis: v=2.4 cv=Zqnd7d7G c=1 sm=1 tr=0 ts=6a311c67 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=w1iEB-1klUxI70mDNfQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: cMWjmuLQkY3flIoAPLDnHu7A_oUumbMG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5OSBTYWx0ZWRfX0Xpi/3QvUyWd
 8uBGC13x091D4u/PRDeVF4ZPpSturAN4XTl9JuqmBhLvs4U6vksYF6FHhBII9eghrgh6Szdtq+H
 CvJlM7SxDIWLimKxaOwG9aELQNsdMqTABBZ8GWZRZnbYqSfVnCHu6Slawfq/92iDIFw9S4hzw7i
 dJZc2Mgp+Hs2NIVInq/Sje1uarE7nVoaM2riBphPRP8ZCQCBz9vsp9wA/Bf2Cj359D/hoKyeiFs
 IrWsWHMhqNt1q3cc1UFoHxHpPp+a9xdnYzyM7MQR8DRpRwWowIiANE4G449htlea03zqYunSX0v
 12nj8qioPylMbf2YIWuQhfI1x5gC13ZYHPSWCccXTGLn53lCO6YNGAh7Wnfk+zLO0aynDG9lDcr
 aWzHlt3Sf+pSpnrJp4DnmkO0qPrAbaXUgcmTAngmSVa8hp4EoBYNtzwsXuHzGGKC/0JqXsMUc6n
 sqp20uIEsitA5XFeSSA==
X-Proofpoint-ORIG-GUID: cMWjmuLQkY3flIoAPLDnHu7A_oUumbMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160099
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC 8/9] arm64: dts: qcom: shikra-cqs-evk:
 Enable ethernet0
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
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mohd.anwar@oss.qualcomm.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 041A168DB42

On 6/11/26 8:37 PM, Mohd Ayaan Anwar wrote:
> Enable the first Gigabit Ethernet controller.  The board layout is
> identical to the CQM EVK.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 119 ++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> index 26ff8007a819e46bbc9ffa3dddc6fee6530a4a7a..1f2e4f6dd7cca436f62ba9f09cd328e5a2079095 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -7,6 +7,7 @@
>  
>  #include "shikra-cqm-som.dtsi"
>  #include "shikra-evk.dtsi"
> +#include <dt-bindings/net/ti-dp83867.h>
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
> @@ -60,6 +61,92 @@ vreg_pmu_ch1: ldo4 {
>  	};
>  };
>  
> +&ethernet0 {
> +	status = "okay";

'status' should go last, with a \n before it

> +	phy-handle = <&ethphy0>;
> +	phy-mode = "rgmii-id";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ethernet0_defaults>;

property-n
property-names

in this order, please

[...]

> +&tlmm {
> +	ethernet0_defaults: ethernet0-defaults-state {

s/defaults/default

Please move this definition to shikra.dtsi

> +		rgmii-rx-pins {
> +			pins = "gpio121", "gpio122", "gpio123",
> +			       "gpio124", "gpio125", "gpio126";
> +			function = "rgmii";
> +			bias-disable;
> +			drive-strength = <16>;

Let's move drive-strength before bias (that's the order used in other
places)

> +		};
> +		rgmii-tx-pins {

Please separate subsequent subnodes with \n

> +			pins = "gpio127", "gpio128", "gpio129",
> +			       "gpio130", "gpio131", "gpio132";
> +			function = "rgmii";
> +			bias-pull-up;
> +			drive-strength = <16>;
> +		};
> +		rgmii-mdio-pins {
> +			pins = "gpio133", "gpio134";
> +			function = "rgmii";
> +			bias-pull-up;
> +			drive-strength = <16>;
> +		};

> +	};
> +
> +	emac0_phy_en_hog: emac0-phy-en-hog {
> +		gpio-hog;
> +		gpios = <149 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "emac0-phy-en";
> +	};

This looks like a hack - what does this pin actually do?

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
