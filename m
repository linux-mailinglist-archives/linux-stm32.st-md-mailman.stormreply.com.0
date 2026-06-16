Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PeVCI7h6MWqikQUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2026 18:32:56 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC2E692316
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2026 18:32:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=ghlKm+wz;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=efPLSuYY;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8FD9C6C856;
	Tue, 16 Jun 2026 16:32:55 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B17ABC5F1CF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2026 16:32:54 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65GFcfbU3543529
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 16 Jun 2026 16:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HTLmtc9ksI3Eco4GNG31SXnN
 US7oWeItGbDEBkSUCOQ=; b=ghlKm+wzr3rwcCYPHJJPPl2IabGV0RObc7v3ufHv
 Af5mdpjw84AwRh4yDrZg3SpfLgkcHAeWBh0FHD0z0HbXdz1N5fNC9k/MBSGSJxYJ
 Z2iJ5D8JR2YlecMzmtQ7caUkP0MhxI56qJVTW5YrCMK59E0NRjz8QaTEKSJuo29z
 Qf5GaL89jZK59uwBwfBZHjYlGG8E/O5iy+LogQu4td2ds3oc7q7m9Pg5nhPEtYd1
 vmdpqekjL90bSW64cEE2Ax7UZGoodtiIkytS55m+XsyGlzKR/ojDXDN6HjvOQLlZ
 WJPlWseHn3+joMGIsr5VZocLhjov4eRdEowpDtqduzflgw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7tyb0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2026 16:32:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2c0b1bb53a8so256345ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2026 09:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781627572; x=1782232372;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HTLmtc9ksI3Eco4GNG31SXnNUS7oWeItGbDEBkSUCOQ=;
 b=efPLSuYY8QAj294xiE+2WCrxDDe85Pob/7YZOYueqDvzMh2Qb2TTpvUbrffItkaI8G
 25fhIRxxbJetv/6/2baSoHzw3gCY+y7NizoVoQnOb59s213aJoDNr2B3k1efddcnZ8rd
 AH2cySX6e7rsWQ+YpmIqrXJ0nrp7loFnlriixbouI4BSjD2fMbhtlPg50IPXI5JKJm+O
 ZFCFWSX8se1ZLuijQcWJU6zGwYnXmYAMjOX+Y7n4YLFibmiTmH34n+/r+89tsIqZNRrk
 V3bsOTGDblZB2uW5Gu5X1TRs7ibGF75e3wtv9ZtZnrNjkCh/Tcum5CPW0pMQLXAhTo24
 1w/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781627572; x=1782232372;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HTLmtc9ksI3Eco4GNG31SXnNUS7oWeItGbDEBkSUCOQ=;
 b=bhBKVsGVINQIp5zcU+0SoEcbeXOaf35T56075+T3nWQCRjTgmu58Z23H8C4ASL0tBO
 uc4oNXXXFY5xjhWwFYGCaXyd6BBO1Z5JZ+ks00aV8Ai+naA9p6AfDobMyPNBi1QzJEKS
 pIwvgM/qk/VsXhxQ2jke+baibe6vi5wJSozSBDo/yCAk8DAiGq/zbfoSfkXXrYZ/eUeN
 GDSDc+9gH+A56sTaxjfltDPprjtf54WxhUjymh4xwAH2f8y3bZ/qVGmSAHtIPR0dKsXB
 T/+fkaJPPzYMGdrPeZrS6rFtNR37a4+yIV2BOTZW5i1iRk86uA5494+EOOndFXeaaXhx
 Le4w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/VgqR80BCJtN5JueiZZQqeHiq/93u8PDAuPtj9sK/VAX/T7XEmzM3KAgTBYJzG2aNMgvOvtMUfg6nFFg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxfJAwPqiy9nklafaP8NdJ573sXWJFOV3K58mJ5nJJjyhfoisPq
 pWPJ8m8BlCBd+UPVOS6kf6oenf5YOHqFoNgQOEsU+RdlIETrP5oGe8AXY3njcuBfbrhqW+xd5g0
 JFpE98//3g6l+1ca2kTFdRSf0EPlTUBBESVMNOaJl/TTazH5TaMDpHB4uMcNT2OFQTUo9V5dGgA
 dtiPytoZM=
X-Gm-Gg: Acq92OFruhrzdsn3T9wLj1YTaZMnefnUr04MpiEFNxIj8Gu3j7f9Pgq/P0IkhTBqI3u
 GVwxvxs0gK/ijjlZJsoQmR2O7F9q3QvTQ2SRuKF97Z9HpmoOVouyHXlPTp4F3SkxrWQBaX8S+zw
 dPP5y4/iM4cjHS+wRUeFKY3IHNc4Wl30LSf/Jqv6/zTN18MiKlNATe2xxTB7AkSH2jlqanDDz0U
 yuuO2V4lSBhCnThWGkdup6NtDonWhKJlk5gCT92WzR7ad3Inm4zYYVe73x80LdakI9AbnkUYv4L
 +gaZS1k5vm02Z41OW0BCB2lpUwPja9IzIl2lwmrKpspliUpymwDZjyJDXphfkm44bQdJ4kAfmiF
 p9mBBPdw5w6IVEPVG0GvGYK56ZJyqy9VJxv8=
X-Received: by 2002:a17:902:8a93:b0:2c6:6425:b343 with SMTP id
 d9443c01a7336-2c6b877e63amr1906505ad.6.1781627572071; 
 Tue, 16 Jun 2026 09:32:52 -0700 (PDT)
X-Received: by 2002:a17:902:8a93:b0:2c6:6425:b343 with SMTP id
 d9443c01a7336-2c6b877e63amr1906225ad.6.1781627571526; 
 Tue, 16 Jun 2026 09:32:51 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c4327ac72asm145948035ad.38.2026.06.16.09.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 09:32:51 -0700 (PDT)
Date: Tue, 16 Jun 2026 22:02:43 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ajF6q5eKz92ddqVl@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-3-f0f4a1d19929@oss.qualcomm.com>
 <42355330-c22a-4fce-98ab-dc22b321ff16@lunn.ch>
 <ai93X/cNWHtEQsDt@oss.qualcomm.com>
 <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <82705420-771d-41bf-a4d9-ed94dff86ff0@lunn.ch>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE2OSBTYWx0ZWRfXzbp5C3sPAalx
 ge+FxUwR55/LBS+/GHStnYvMv1poYQMORYLrUyFDVIPokGRBAm8i2JR2Mj4pk9XOnmMJO4UFtL0
 Bj0fCArcUaUveUhg5kZTziPpVbrbvZ9NxvTr1G/T6NERFinSKxZS4B2pPVDVVdK+hh/5s51ycMi
 g6ggW8ogpuefbROZcRKCHl+FWOC2wOlxQ7c28UzRM3GJufRZUnNNwONIzcVq1DrBArYCkQVEHLz
 JqgxpfAyk961hCnOg2+ZVrZcQ3GI/9iXCrg/0Mt9VKtLRjBiofOG0fWt5M/3hDWn8oiN8rBB9z2
 0DuxK6Uhr3Ypc6KTHn6cG7RIp+95p8YdnC724+i5j7Mz9TClGX3LZJW2TQ5OAdwo1lG7qLxNwaM
 P4OPXtjN/uQNjyqVDtQNAp0xeuPx8zrcrd4otMshzXpmEFR9LTk1ydRSAi+Yoo79W9MaXJ0qrqs
 RbSfgYgKNkaewt1tRqg==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a317ab4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=1fSEK5Xs-BiMaI_fvDcA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4aqTIHZsRg8HYgwwuv-1ySYy_YVqmIvN
X-Proofpoint-GUID: 4aqTIHZsRg8HYgwwuv-1ySYy_YVqmIvN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE2OSBTYWx0ZWRfX51KGmhYx3n9Z
 qYUIqp/GpaE5yZ6Z7fD3rwGEwhaKISITqpKuVMjKze2x/cI7Zn/fux6oeRWa04rEAC+8NPies9V
 m64bvRh7TiVSwPfSdUGgxQGGMKjUyTo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160169
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH RFC 3/9] net: stmmac: qcom-ethqos: fix
 RGMII_ID mode to use DLL bypass
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
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,armlinux.org.uk,lunn.ch,google.com,lists.infradead.org,redhat.com,davemloft.net];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:davem@davemloft.net,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2EC2E692316

On Mon, Jun 15, 2026 at 06:48:55PM +0200, Andrew Lunn wrote:
> > > I'm curious how this works at the moment? Do no boards make use of
> > > RGMII ID? Are all current boards broken?
> > 
> > Searching through the DTS, I found that we have two boards using "rgmii"
> > (qcs404-evb-4000.dts and sa8155-adp.dts) and another board using
> > "rgmii-txid" (sa8540p-ride.dts). No board which uses RGMII ID.
> 
> So this causes problems. We cannot break existing boards, yet it would
> be good to fix the current broken behaviour.

I am trying to track down the sa8155-adp and sa8540p-ride boards. The
EMAC on QCS404 is extremely similar to QCS615 Ride [0], and I got that
board to work with this series (with RGMII ID mode). So I am fairly
confident that QCS404 would not break (if its even booting up with the
upstream kernel currently). Also, I think we could change the phy-mode
for QCS404 to "rgmii-id" from "rgmii" if these fixes go in.

> It could be the best way forward is that you issue a warning when
> "rgmii" is found and pass rgmii-id to the PHY. And you also change the
> two boards to use rgmii-id. Lets think about the rgmii-txid case once
> we better understand it.
> 

As Konrad mentioned, it would be great to know if we can test out these
boards. Looking at the different versions of the ETHQOS programming
guide, stopping MAC side delay should be as simple as what we are doing
in this commit. But whether the two boards work directly with the
default PHY delays is unknown.

	Ayaan

[0] The proposed RGMII fixes would help enable ethernet on QCS615 Ride
as well. I see that the original series had a lot of issues:
https://lore.kernel.org/all/20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
