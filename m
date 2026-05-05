Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKf9Hgce+mkJJgMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 18:42:47 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E514D1829
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 18:42:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD154C87ED0;
	Tue,  5 May 2026 16:42:46 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 307BFC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2026 16:42:44 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 645EKwPV152048
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 5 May 2026 16:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=iAYFcoBuVm/XcG40EG9yN1cf
 01dwHoZZydGSBQe+fRk=; b=OjftXHJV19fGxCUgY3Jz9FOUwuFlMyIvE2v9eq/r
 Csyto4GYkW31L5U9eST4MIKUcvENbIA8pp6Ma1FUOidL0K7MOjMfgjXVL/i0FnDA
 XphMZ8h4+N/0ZYpTL2BPZSQhxPzFo/K2KcmPT6DYB+4UKJ+dwRrvZoCKCj49KgJH
 7c718rJcgmjNAENjF1HDZTYX7JCdBHeSLp6Nn7tv8gPxJp0fMji/WDDx6CJCZaYB
 pu4dUwRprcupX2wyhzbWr/F8IvsWvCJJjOU9ScFdQkHTZVUoPg4jrN1N4dWw7f1W
 YfBe34FRZkVd/mj00lulLO0reQND555HWK3GlKXbsaM5bQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj808mqk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 May 2026 16:42:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2aad5fec175so73918475ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 May 2026 09:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1777999362; x=1778604162;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iAYFcoBuVm/XcG40EG9yN1cf01dwHoZZydGSBQe+fRk=;
 b=GgEHZMo+Ah6ks7f1NXUaRN0c1HLEqr8WvFBEFRhTO96+BH9KNSzrFpYGYa4bKmh1bc
 MOy6B06VAzVrp/MlWjElb2adY14J51rpzpGcRXB274UkHQu7mCkzoxdn7s/FTxS/qHcS
 knrL29Ohc5nyBOOubWpxOHLhmodHtFUJMyHwSHHhnRy5YlVkFnsQafqRr30gYgIIdo8q
 InIkZYs6jo8/fxn7XF5MEy8U2XNQySYMcj9eZ7X7D+EmmVbXEgdK6rsTp1cKHAJIlNB2
 N4bUiMR83GuUwEimza2IFGvwfnKFFij6tGWivEKc+B8IWZfG8H6pEK7HFbWA6MzWPx2C
 72/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777999362; x=1778604162;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iAYFcoBuVm/XcG40EG9yN1cf01dwHoZZydGSBQe+fRk=;
 b=OGGAy7YS4zCSPehpquLQ4rebYTH7r0o5hsabYLYWs6o7sk7JbH75oRo+Z56p+XSxsQ
 VEkHMbZuDJBBm96Li6WYoOWKINOUprevXA9btDKsQX56d6QG2AVcU/yqy/ZvnIaX5J6S
 R5qGkLLHPVfii4AA0vxg3cFCXwdZ+v2uxjv37ueCR4c29qfL2/GSXH555pNFbxYydyNc
 hAjTNe6hvSO8SwXpjx7Mq597uT6sBT4mnHqRwA2A9gWG6MpQNM0tkkmSzOHmO5KU5uZd
 4PafatVKq9MJvJcdfecJbevIRooqpxaMTaeh8dci3CKcTFK1m/PZ9PieL+ZrGjAfk/BY
 iu3Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8ixypcYEwIsXm1Wd6Hw3CDjtx1jHZXkjCVgEUgO/6TPADSYaRA15LD9pYAF6GK8AwXGSzgdIPWuRq5HA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyRifmFHKH1//E7OwmyWfhuxKSu0xZApQddmFFEF57TpvohbSD6
 P0vgNMQ562M/87NYHKE52HwpKqcbI6yjwdtfL6+7rTr4QXh20YnUb7d86ze3qyzbN9IPupCJT1I
 5GcrIG1luPKyYMHCQymeqN/2ytO7lhZxUi8M/BObefJVhhCMYUodNX9VKQvR3xzGj18KegTSwBn
 Vyhz6pkzI=
X-Gm-Gg: AeBDiestxY37u2HCIwIutgQdBg8Vs7be2sdLSarHpc0h7eIwUrZN21ZyLk61C7C2I8F
 blAKIcx09lIaAAQU0+s8VCSlqrCSFtbGv5yNFtrbrmZq9z3rZfdYB1kzjdFfDPUYX8qJ10mduzO
 bF8QIlVBLGRIacSJLA+G8IM827IWxR/sPT+pP5hp4X/AldmO7k2JBWv+Zvs0QyWjPP66s1/Ru+N
 ha6M7PsnpzxZW/IqVoqxhZH4qYnZJBVzR+biqUItFXFXoWefJwwJpbimLI/AcScWkkb9ysluBEe
 a73YuGk6564Li8AzEC2mWsWlmRlV5+p9C3+Y05+rtpIiKsyEqQEtn8EteTZhvfZk6FtVUwCBaPl
 1ny98E7h39+kVKFUtmSDmML2H4LZT5JBCKnfNW9SYBLbE1g==
X-Received: by 2002:a17:903:2ecc:b0:2ba:15ff:345d with SMTP id
 d9443c01a7336-2ba15ff376cmr108941625ad.35.1777999362303; 
 Tue, 05 May 2026 09:42:42 -0700 (PDT)
X-Received: by 2002:a17:903:2ecc:b0:2ba:15ff:345d with SMTP id
 d9443c01a7336-2ba15ff376cmr108940885ad.35.1777999361838; 
 Tue, 05 May 2026 09:42:41 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b9cae0f6d8sm144847685ad.39.2026.05.05.09.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 09:42:41 -0700 (PDT)
Date: Tue, 5 May 2026 22:12:26 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Message-ID: <afod8ot7xb+g0wzN@oss.qualcomm.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260501155421.3329862-13-elder@riscstar.com>
X-Authority-Analysis: v=2.4 cv=XvnK/1F9 c=1 sm=1 tr=0 ts=69fa1e02 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ee_2aqc6AAAA:8 a=lW0hg0oAPnnF6MRRTAsA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: a388PT70MJggB4qxIfetSx2ex305_8ui
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MCBTYWx0ZWRfX5D4zSHq9BHGF
 E5p6LxUmJ00qT8pyZgYYOJzFO/VEJcb/jPnyzd0Jm9iwPSIZSoqRSznAZLfa/B88pKyPjDn4TIG
 iQG4/jXIJIWTwj4Yu2YIH3XRO6hej9KhSoHlwXd95VhgUFYn4lNAt3EAlKAxRkHLN8lIC5LuHjW
 mGS8hi7d1ltURNj1vVXFtr+UWdMO1zeV49wksXVAWe74/bE99TnpteJNrFB9V6DVJMkVDWKkVYE
 bulhlQ0RKHZ/gRhzk7SDHWY4TAmSDXYTc/7gEn30fga/PrePn78GWv7EHNg51E3tKXZlDjv9Wh1
 K7HdFTvcy7WGk3YgcRK3HT1wQQT2PKjdYL+ANAbKhGcpI55jmiq1+NWpm/m9G0OAZfWSxgd+lC0
 N3JhnU4D93XWeGx2Inq3beu9r5elWTiyyW2sPQy4109mOugVVavCa5i6KwZ+uHC1yCA2d3yeR3B
 Qm9Pkv99IE7h3aoy5iw==
X-Proofpoint-GUID: a388PT70MJggB4qxIfetSx2ex305_8ui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050160
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, maxime.chevallier@bootlin.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, kuba@kernel.org,
 pabeni@redhat.com, konradybcio@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, hawk@kernel.org, arnd@arndb.de, brgl@kernel.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 livelycarpet87@gmail.com, linux-gpio@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linusw@kernel.org, a0987203069@gmail.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 inochiama@gmail.com, krzk+dt@kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, andersson@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 12/12] arm64: dts: qcom:
 qcs6490-rb3gen2: enable TC9564 with a single QCS8081 phy
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
X-Rspamd-Queue-Id: 20E514D1829
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,riscstar.com,xiaomi.com,google.com,st-md-mailman.stormreply.com,eswincomputing.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[48];
	FORGED_RECIPIENTS(0.00)[m:elder@riscstar.com,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a0987203069@gmail.com,m:davem@daveml
 oft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.883];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,oss.qualcomm.com:mid,stormreply.com:url,stormreply.com:email,checkpatch.pl:url,riscstar.com:email]

Hi Alex,
On Fri, May 01, 2026 at 10:54:20AM -0500, Alex Elder wrote:
> From: Daniel Thompson <daniel@riscstar.com>
> 
> The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
> TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.
> 
> There are multiple builds of RB3Gen2 with components included/excluded.
> That means whether or not there is a phy attached to eMAC0 depends on
> the exact board. However all versions include a TC9564 combined with a
> single QCS8081 attached to eMAC1.
> 
> Add properties to the existing PCI nodes to describe how the TC9564 and
> QCS8081 are connected to each other (and to the host SoC).
> 
> (Note: "pci1179,0220" is documented in the "net/toshiba,tc956x-dwmac.yaml"
> binding, but checkpatch.pl doesn't recognize that.)
> 
> Co-developed-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>

There's a minor typo in the PHY name - QCS8081 instead of QCA8081.

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
