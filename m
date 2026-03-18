Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCz7KkEju2lofgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 23:12:17 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5305B2C3479
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 23:12:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0112BC8F262;
	Wed, 18 Mar 2026 22:12:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5668EC87ED8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 22:12:15 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62IFggTi671484
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 18 Mar 2026 22:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=wfPdTTKFeIrqOaOP9gRV4ZVq
 TsDeuSzuEH83cPJoqOo=; b=pN0BTH956IbNpzhiCfIyryXAETBTLYRK+va1QblI
 uPVPzHuAsZdidVMzHb0ZlRq1C+WVLohRCpKyFHQZNC7bX0n0jGatOA8qdiO9I3Kz
 EDoDokM+grH0gdgqY2yYXlX9/SlZqNhNBFGkB0saihVCLau/8+DqhcDPwrpL0GXX
 o46hkX6hKKMBOt+VVSNbu00VH7o6GtahG3S6WhTFXYP/YIk6s0AO4NoJ1lHRvmJ+
 galis3GPPV1yljFPLpBaMtvRcgnkG77WhuFyJUm/Qym5LNb2zFV515z7/4FVUIM4
 lDf7RL083RJN4R0deOPbyCLJr5NlTnKFkXMOBg5hOstiig==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj52e64-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 22:12:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-8230d6d54a5so1121706b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 15:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773871933; x=1774476733;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wfPdTTKFeIrqOaOP9gRV4ZVqTsDeuSzuEH83cPJoqOo=;
 b=JujFhPrWmrGE1kktterxTT4xHB7imgTcnfXqdbzP93nA8zA6IwUksjUrkKJULpJD1l
 uvQKbZb20h34VPKan3Fb/egeawt+036CJlHbkx2Xe+rL1pbzbdFRwJQhZ4uiqr1O0xlh
 8/UzFaMNV/RN1W6E757zd978YsMl3KZ5meEb9SKWFKTVS1gN+hJWm2mm2EKj2tuWmRst
 TB4omG7Dk8A07Nv/NGdkKiU9m1/nmrd9GtHhXE4gloYWfrJbReRU5Zr7rbNSIJlGeVF/
 nZZLPzbBRTHteuX8ycNbEI3lKREMzPqLAyAUNBDF98E0qR5s4kW+K29ZqHa0r6lwqTrs
 Fnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773871933; x=1774476733;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wfPdTTKFeIrqOaOP9gRV4ZVqTsDeuSzuEH83cPJoqOo=;
 b=htHXXJ5TpgkkZVjnallgwG21sS5seKA8KCAEXM+20jjE5ldBELt/fmr0E1xxRZmx4y
 ZTH+sfH2juRJ4dVC2Nh65yA9mcDF+z0PDtfsqDuy3OcIqro8WpyV0FxYglp1/JQHiwCn
 rtg4b1vLrAPGZ2hAJnVtz7BhS9nGx0ehCp9zS/V2LNK5yUnoWly9ZqKsraM3Jksz9W50
 TW9IzY/H3fsvuE76oUTJpVzipkBnE0xB3B4lzv5iZbFyKwXDdoGGDQmEg1bIko27o33g
 BVBaVO0ECvCk15h6EBhQnHAqJuIwozfNjOV7Ua6pI0aDdadDVnYLTDv9VMTvMlCFj088
 ++1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoso+mCepMJyl1LHF6MUB7KWgnawbVxsnZPbVPSz4msV0hTqu5sV5hFvoIJ/7tA9wcUf9tRifVSmoNoQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwNzIid9xdmm8eg5mYLJ4l1X4BWMOeatTKc/6fNCJXYociuttHb
 ulnkI/Tdi5xk5kfArf28jp2VHz3Shd1EdxVd19mHtMQvaj4Prk92djv6JNirFwkGgRgd+Y72bnv
 eT0Hsymjv39zBkqz7mhi0cyf/gA4AZbULs+cl1ZW6FWrhZsyYAagQEAaVDc+6ih59N/nZUJ04sI
 ApRMFWn+U=
X-Gm-Gg: ATEYQzy08Jtyzvzc069yc+ytfI3EXztovtHmBx/x0LShLedpGCA1yGKAsYH2u3zWUxR
 F2KvGQz8uZdH7r4oQHGHUPlDDaEr4yTU0UmGZVX/FqDe+7hHhBwJ7ZR6bmihNz74yy0m72U03FS
 wZJZLAzn0GBjz0gOmjCYGhK7Uv/vH0aFlGZNz9e55jgU3RTSU2Eql3ONoNNzK4N0qJVHaYz7xuQ
 Z752KQHLHW+erlXdkFzqrPCPdsZW9DAOQj/pKl8WhJiANdmnVbdnZxzcqHpZ+XJKKmTJzMqZYcn
 9+aNGzEKHkCOj6e/K/j83xCeJnQt2ZZ00OHhFFPGKu7CzQMWcKU63pDwk9QBaq6aT+Vj+Ng13rl
 Wd6SZXSWBCOGF+EAUS9kpIufDOQDFZBXdrBU=
X-Received: by 2002:a05:6a21:6b02:b0:398:a41a:371f with SMTP id
 adf61e73a8af0-39bb2498f6fmr944720637.20.1773871933404; 
 Wed, 18 Mar 2026 15:12:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b02:b0:398:a41a:371f with SMTP id
 adf61e73a8af0-39bb2498f6fmr944692637.20.1773871932733; 
 Wed, 18 Mar 2026 15:12:12 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82a6b56ac50sm4778552b3a.16.2026.03.18.15.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 15:12:11 -0700 (PDT)
Date: Thu, 19 Mar 2026 03:42:05 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <absjNQ2s3Z5N2Zwo@oss.qualcomm.com>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <abdEscs44fU4kRag@oss.qualcomm.com>
 <abdYu864OmNWiWIW@shell.armlinux.org.uk>
 <ablpxwGks9m38fhM@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ablpxwGks9m38fhM@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE5MiBTYWx0ZWRfX79Y0P29IwDWY
 D57B/1o2J4jfMeASU9ui++VJ2GNW8hfpGUXvQFGSNjK4DSQ1+zYxhN5hBXF1NzmY9wAXPVGvCKk
 bEawJWjO+s81NanJwibkjX20UjxKZGem+jkRxoIfc0mxVYpxtbr0c7Zb7sR3Bdxk/4CR4tXNPn7
 HDXkvj38gnaYIJZjkeluSw9C6CLzSsbmSh/D9L6O2d15CQ8Dky+YQScdFUE1OHSP0cx6RE1JNZh
 HmjkgU4j6qS+WwjY+q7UrBtT+m4QRhAdFm4eqvRkm2oiSOhUN+S8TUXKsyCuISisOlGwnsdhC+r
 DxApMwuJe8IWyUd/CS0St5RKmL/X8Ooh462wEq50UHwanEO9opOfv7b3QBgsQTZZ8rMlAIjw2lJ
 0bc+sp4k3NfUdr/VYPK/N4qW75YzdCBB0nzdkx8yk0i0ITKdo/k5yc7qXjjTY6f8EcawH4fB76L
 5Ncih0RM2KCdtZKYjyw==
X-Proofpoint-ORIG-GUID: EFpyLCr64qriCiWJ7tbQte624ce8su4U
X-Proofpoint-GUID: EFpyLCr64qriCiWJ7tbQte624ce8su4U
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bb233e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=9Hbxq-cn08ijON1ErxsA:9 a=vUQH8iars7gmROI7:21 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180192
Cc: Andrew Lunn <andrew@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/8] net: stmmac: improve PCS
	support
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
	NEURAL_HAM(-0.00)[-0.393];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 5305B2C3479
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,
On Tue, Mar 17, 2026 at 02:48:39PM +0000, Russell King (Oracle) wrote:
> On Mon, Mar 16, 2026 at 01:11:23AM +0000, Russell King (Oracle) wrote:
> > This will be because we're not attaching any PHYs when phylink is
> > being told to operate in 2500BASE-X with inband, since it thinks
> > that's the media. That, and, because stmmac has a long history, it
> > needed a special phylink_expects_phy() check added in stmmac_init_phy()
> > which his what prevents the PHY being attached.
> 
> Okay, another idea that I hope will work. Please drop the "net: stmmac:
> qcom-ethqos: enable inband mode for SGMII" patch so we go back to using
> outband mode for everything.
> 
> Then, disable the call to ethqos_pcs_set_inband() so inband mode
> doesn't get enabled for SGMII - as phylink will be telling the PHY to
> disable inband mode.
> 
> Does that result in functional 100M, 1G and 2.5G speeds?

Yes, but with an asterisk.

 - 2.5G works fine
 - Shifting between 2.5G, 1G, and 100M are usually fine.
 - Booting up at 1G results in link flapping (it gets resolved if I
   do: ip link set <interface> down and then up on the link partner).
 - Similar link flapping also happens when shifting from 2.5G to 1G,
   though its not always.

Attaching logs of the booting up with a 1G scenario below.

	Ayaan
---
[    8.650471] qcom-ethqos 23040000.ethernet: Using 36/40 bits DMA host/device width
[    8.650486] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating
[   11.569262] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
[   11.577988] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-1
[   11.586665] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-2
[   11.595357] qcom-ethqos 23040000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-3
[   11.619882] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
[   11.629468] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
[   11.640202] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=288)
[   11.649691] qcom-ethqos 23040000.ethernet eth1: phy: 2500base-x setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
[   11.680117] qcom-ethqos 23040000.ethernet eth1: Enabling Safety Features
[   11.688517] qcom-ethqos 23040000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
[   11.698080] qcom-ethqos 23040000.ethernet eth1: registered PTP clock
[   11.704633] qcom-ethqos 23040000.ethernet eth1: configuring for phy/2500base-x link mode
[   11.712966] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
[   11.721115] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=01 phy=00
[   11.730157] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
[   11.738748] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/2500base-x/none adv=00000000,00000000,00000000,00000000 pause=00
[   11.763778] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/1Gbps/Full/none/off/nolpi
[   15.215445] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/1Gbps/Full/none/rx/tx/nolpi
[   15.226572] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
[   15.234297] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
[   15.242902] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
[   15.251044] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/none adv=00000000,00000000,00000000,00000000 pause=03
[   15.276661] qcom-ethqos 23040000.ethernet: PCS Link Up
[   15.278115] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   15.283364] qcom-ethqos 23040000.ethernet eth1: pcs link up
[   18.317922] qcom-ethqos 23040000.ethernet: PCS Link Down
[   18.323424] qcom-ethqos 23040000.ethernet eth1: pcs link down
[   18.323977] qcom-ethqos 23040000.ethernet eth1: Link is Down
[   18.329375] qcom-ethqos 23040000.ethernet: PCS Link Up
[   18.340467] qcom-ethqos 23040000.ethernet eth1: pcs link up
[   18.356522] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   21.358679] qcom-ethqos 23040000.ethernet: PCS Link Down
[   21.364183] qcom-ethqos 23040000.ethernet eth1: pcs link down
[   21.364745] qcom-ethqos 23040000.ethernet eth1: Link is Down
[   21.370130] qcom-ethqos 23040000.ethernet: PCS Link Up
[   21.370139] qcom-ethqos 23040000.ethernet eth1: pcs link up
[   21.397194] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   24.399108] qcom-ethqos 23040000.ethernet: PCS Link Down
[   24.404613] qcom-ethqos 23040000.ethernet eth1: pcs link down
[   24.405168] qcom-ethqos 23040000.ethernet eth1: Link is Down
[   24.410563] qcom-ethqos 23040000.ethernet: PCS Link Up
[   24.421657] qcom-ethqos 23040000.ethernet eth1: pcs link up
[   24.437636] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   27.439468] qcom-ethqos 23040000.ethernet: PCS Link Down
[   27.444971] qcom-ethqos 23040000.ethernet eth1: pcs link down
[   27.445528] qcom-ethqos 23040000.ethernet eth1: Link is Down
[   27.450920] qcom-ethqos 23040000.ethernet: PCS Link Up
[   27.462016] qcom-ethqos 23040000.ethernet eth1: pcs link up
[   27.477991] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   28.026087] qcom-ethqos 23040000.ethernet eth1: phy link down sgmii/1Gbps/Full/none/rx/tx/nolpi
[   28.035077] qcom-ethqos 23040000.ethernet eth1: Link is Down
[   33.336433] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/1Gbps/Full/none/rx/tx/nolpi
[   33.342861] qcom-ethqos 23040000.ethernet: PCS Link Down
[   33.350674] qcom-ethqos 23040000.ethernet eth1: pcs link down
[   33.350724] qcom-ethqos 23040000.ethernet: PCS Link Up
[   33.360912] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   33.366768] qcom-ethqos 23040000.ethernet eth1: pcs link up
[   33.386487] qcom-ethqos 23040000.ethernet eth1: Link is Down
Note: doing a remote link toggle recovers this.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
