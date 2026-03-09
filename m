Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLCIDpe8rmn6IQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 13:27:03 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6516238CC6
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 13:27:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C078C8F27F;
	Mon,  9 Mar 2026 12:27:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BE94C0693F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2026 12:27:00 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 629C5b48526725
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 9 Mar 2026 12:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rTeDok56LaLfDQuOKEeyhxvT
 asa4vMf5dB210aMR+zw=; b=oXZi76l39P4j9Nrm28AcHNcmVO6jQ/URLpNfbsky
 RDe4ewVm0fu1BfayaHIlA7XjnRvmDP5OqdUbkNM/cC+OTKMfwbUPFt6KlWtfUZcw
 CMqooEO8u9zzOZLY7b5YzVDv90S68eqzO2vSBYVBm7dt5V/tB+lg/nO9q5g8QPO4
 t3DUq29qFjDwbLA1mZOjZruhEG9LajgCo4l/I5cmPxNKk4RCNGO27jIfxbeWvdre
 M7SSYEewtsVtmDXOZ9xKrbfkqjbZ0mU5eCoUv0kuPUvuh/a1b/riTQQ/MA9WyV1t
 vIgJVxx9G30zXya+Fu2uBfKAxP/SSeAIPVtpBNyc8SJCag==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkg2bd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Mar 2026 12:26:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2ae57228f64so83099195ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Mar 2026 05:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773059218; x=1773664018;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rTeDok56LaLfDQuOKEeyhxvTasa4vMf5dB210aMR+zw=;
 b=IO3JKGT6kIZmKQf9NiR9MCknRHHh4SaqR7jTD+JxMb6rzokLTf53U+5SnCEcksmHKu
 T0cMICY/vbGPSWpArVzodlXCB1BwDaUYOrHFsAHI3Xryxo6Rp9t1hdCoCOuAR10kzM+K
 fSTBr9qx1klADs2ZN0OA+XwIDpbZFmtsqmeiDXNiwxIJas7rM7Fyj2Lr4cybRmToQPVB
 qKCa6zN6CGtDkpORBJjWXSDebBMIf8ySbD/oBz+WS6ZWvy1ShStOGBeE5FCMYC3RLhd7
 ppESzazBNHDzW5/CVIk/f25/AJLdFBtO9dUKwm5Lq53TaHQRzzou0ddDNkaTiKrqfjqM
 +14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773059218; x=1773664018;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rTeDok56LaLfDQuOKEeyhxvTasa4vMf5dB210aMR+zw=;
 b=D/QNAIhDRjooJxeq2gw1NwhuJZFTOjMJ7XRhuRpUDI10IcXQBs6TOXXgylLbZPHFpc
 4+HW1weoGo6MvXT9RqFYTU3ARK40yFqmAWJTRHOg1kc+oOyoK9PrL4GBjcAl+QAHe81a
 lEfHCCs2Xf/g+4IlIccg9HcNvowrd9gXrVMXeWPKmtt4tR6cA06aPqbLaLT7uYKUQrII
 4RoAkukrxx9xD13vgX/gZrcgxOp1lIvVFG15hN0b7blnSLEg20UDyWqBpZSSm5Bnp+Tj
 bQiamKoAW6kWNNyAOo9kBgczzuTotxGQZPS4gcv4m1hYeNCninSjKSFSuhrtvV/E9zcd
 qM4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5sTGY6eyJPL9zR5+G1yxIyzdxlNFDtiBbqinAQx2pucmS3xxPBd29qisL5Ge2zigD5szKrB15vE4qgg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxYK/RGhgsI+cIrXtgwVfNZIfIOxwXc9SiUmQxebdihkaiIQt4P
 z1izEhzibIe5j2UrRNfaMo1ib/KXR6RCntBVu+8CD5NXQNPJRyiQnHrHxxviuvdMUJ6J3EIg11a
 DSyuxzkrJxjItjj7byTDn6UTvM5fQQyTJYA/4BJa2Dgm7+oZegPPxd/Vmz1rFXggiQnwTlEZwbp
 jC1AO6H2E=
X-Gm-Gg: ATEYQzylJ4g4BtTpZeyTmif5DXaWolKCabrklWVebnUX6IMpcT76C3hKKp6d94R+fLZ
 2P0lNdwNLrHozO6J/71WmWrLM3OHKqmd+713q9DhBq78klX6ew2IKS2nue5zOy+2UdlpWIgUu+t
 f29toHJoCWvpWoSPmUmtv8lpkrmqEKFE2PCnebEoQbNKK+jpC5s3gxbeBp4kiigK0kTPrVW4EHy
 6scTCRbFk8Y1TwBc0YXXQhR4d6wxDDJwxJ5aBVE8EuqmAQeJBaS3Kv9I3JYNDZRO0r9qwisKFho
 ZIuB6dbyrEXB+0Ekpo61IOixKP/6YCzB4ZYxVHX3nO4UxSgPiV6NbIJQLb0+VTRUx52i+4B9y/o
 2hwn9QBZrNx/o0BOO+ZZpbobjpMJetoelnzs=
X-Received: by 2002:a17:902:f68f:b0:2ae:42ce:1e5a with SMTP id
 d9443c01a7336-2ae824b8437mr105759855ad.54.1773059217738; 
 Mon, 09 Mar 2026 05:26:57 -0700 (PDT)
X-Received: by 2002:a17:902:f68f:b0:2ae:42ce:1e5a with SMTP id
 d9443c01a7336-2ae824b8437mr105759455ad.54.1773059217193; 
 Mon, 09 Mar 2026 05:26:57 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83f751edsm154196825ad.50.2026.03.09.05.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 05:26:56 -0700 (PDT)
Date: Mon, 9 Mar 2026 17:56:50 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aa68itP3mXx0WUNJ@oss.qualcomm.com>
References: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
 <aandp3FYSJbwoZxo@oss.qualcomm.com>
 <aatLjarGu_qdRkP2@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aatLjarGu_qdRkP2@shell.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69aebc92 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=GKVA2r4k85XJU_JwPvIA:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 3CZUq0rMaqA63vI1dK48ReK_0iD9OmAH
X-Proofpoint-GUID: 3CZUq0rMaqA63vI1dK48ReK_0iD9OmAH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExMyBTYWx0ZWRfX0+C9GbO4aDiB
 50PddJI/gDv9e8Z3OCDk28CgtyobsvoKdP2q7YQOGv5A23Z/d3pCMRBK2yY1JFNlx22ifaUcL98
 MF6vFgaYDbKFPCYJ/Ku0g4wey46q/dt3ul4sK0kJQoQ5DR0OUfe2QnhfK+PN34sBQe4SlkDY08m
 +rgJDk55U3D5GGn6uMaZX5ipRnelV211UxaGlRy2AIFXZuOUaJyZHt0PHKP+0A1t66ERh+7KCDD
 04X02FEOzTq7zUgxsEpDytWiztz57WWxthsSVR5fWa7qbhZEW1uDDfz9kqVZuBCO2lkisz5ElAC
 lQEbUBlx1EGPEdunMmvFheNqoUALjtPwQG2/5640yD5CahS3wIX/9+63hUYr43/kueW7/3JWi+f
 EgKmZP2x5WjMTphoSQZHqyX1D/EBpN9+Am5vOnXJiU8uOKawYs6vvRPlXippub5tQUo6+rQwUg8
 5TWVQfGTeck7dqg7kqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090113
Cc: Andrew Lunn <andrew@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 0/7] net: stmmac: improve
	PCS support
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
X-Rspamd-Queue-Id: C6516238CC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.624];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 09:47:57PM +0000, Russell King (Oracle) wrote:
> Has it always taken a moment to stabilise? Note that the ANE changes
> will trigger a re-exchange of SGMII in-band, which is why you see
> the PCS link go down and back up after the "ANE 0->1" message.
> 
> I do notice:
> 
> 	qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
> 
> which is a symptom that a clock is missing. There's been some recent
> patches merged into net-next which changes this:
> 
> 2cd70e3968f5 net: stmmac: Defer VLAN HW configuration when interface is down
> bd7ad51253a7 net: stmmac: Fix VLAN HW state restore
> e38200e361cb net: stmmac: Improve double VLAN handling
> 35dfedce442c net: stmmac: Fix error handling in VLAN add and delete paths
> 
> please indicate whether you have these applied.

I don't have these applied. I was running these tests with my tree which
had the serdes patches. I will move to net-next now since those are
merged.

I should have done a better job of cleaning up the logs, the VLAN filter
timeout has been there since forever.

> That's currently expected, because phylink thinks we're using PHY
> mode (where it's in charge of reading the PHY and telling the MAC
> what's going on) rather than using inband. This is something that
> will need to be addressed later.

Understood.

> I think you added some debug between the logs that you've provided
> below, which I'll take as not significant.

Yes, please ignore them. I forgot to clean them up.

> This reprograms the vendor provisioning so that we use 2500BASE-X
> for 2.5G and SGMII for 1G and below with AN enabled. Note placing
> the PHY into low-power mode while doing this - this causes firmware
> to re-read when exiting low-power mode. I wonder if that's required
> in aqr_gen2_config_inband() - but that will cause the link to go
> down.
> 
> Note that VEND1_GLOBAL_CFG_AUTONEG_ENA enables inband signalling on
> the link.
> 
> With the above, you should be able to test various scenarios with
> the PHY - and changing your provisioned 10M configuration will likely
> get 10M speeds working.

I will pick up v3 and try this out if needed.
I am also going to test these changes on IQ9 with the QCA8081 PHY which
shouldn't have this issue.

Thanks!

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
