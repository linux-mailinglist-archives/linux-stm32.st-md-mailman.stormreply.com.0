Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eP9eAbTdqWm4GgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 20:47:00 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AAC217B9F
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 20:46:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5CB2C8F26E;
	Thu,  5 Mar 2026 19:46:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE710C8F26D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Mar 2026 19:46:57 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625Hfg4e936068
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 5 Mar 2026 19:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=BfZ8msjWi+nSqCzSNJt33u+/
 Gp80GIWb0kkR+dbpO0w=; b=nVyPjx1mleVWKNdhQA/r5DpCmDj1+ySyaOrt2DvP
 ZZuucK4P8OV0c5fTzaGFmJi2B1cqEG0UtRtnDxoKAEN8K1skc1pD1S2csm0NdzQJ
 qkc5Q7qiqa9D9cqLtXNJlrJaJNHhFUvOmGhtaGzViaKJeLxSx7LYEyG5JirpUF/I
 89klpX/FiIBcLBXH+JMDnE+l5VP3+1nFbMBNFOJoBUnOR5eroMvit7na3nyDnDkq
 6lNqB4Rz/m1mv1pjI7XPkffqxV+7wjm2k4jkpz+RMXJsLF4aaKNXYvxBhS5R+FXL
 zdm8V1pezHxi7lYV8HF0M27GjgIaYPEzsdezPy8WjIRZ1w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq04u3k2q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Mar 2026 19:46:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-82983c9d78aso2917361b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Mar 2026 11:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772740015; x=1773344815;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BfZ8msjWi+nSqCzSNJt33u+/Gp80GIWb0kkR+dbpO0w=;
 b=VRHrds2gejTRdzPviuwKG5UVUfNISHL+SM9X1znc5FQakLJim5GDTZ2yXJEUGVYIvj
 CHcbdGV+KDAUhYJBLXijeSo4qtVw31o26NLcmvVV8Jf8UN4PJ+j96MZgy4B/XCNDwE3b
 YL4VwO7DNCNiutCj7jS9vBqfFV/4EYhdd/mDZr/4AXXte44lRd8YlhMOpC0j6mZJdGif
 4MnVH6crvNR7OiHHoYcpoLsmviFVJQzhnN3pyt2zMTSmTpsTsKa0hmcETmTLIgZix/JV
 y6vJ8KjckwjQdPiZfR9Kg8Ak3pmUxznEQy1XH4yomr1WlLne+PdCKTt8anpvZ4DJqhp2
 sYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772740015; x=1773344815;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BfZ8msjWi+nSqCzSNJt33u+/Gp80GIWb0kkR+dbpO0w=;
 b=OU4oQzXBj9uC6lEqQyiuM2cA3qMJrETngpbyNjseVhU04a1gPP7s/QjBB2qv7NaHXm
 Es8ycVGEnhA/LUzeYReP9y80nFUOTuTfzb3H2c20AbDZoX5Z7pkn/8C5y1lgwS/qNhOU
 7SP5qvkRbRnKb3BssxQt1tZHZvIC0OyVfpMnTA/QXhpQXvlfV1y24AQZ6CoZ8xB7kVAU
 2m9hH3V9mb2fxTZsQqwoUGh4tA9Rzcp6KGObxxiNwSCaeiNZjEX++329QsefquL9WrbQ
 12rYjsKCz1z6RvqzNBXOelti9D8z/xFVQ5ktDSzm7Jnv+54lgZF8srd4fGw9aGyrcoJI
 y87g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJfF8354NZ3K5G4Hxl1amXGG8jR+C18JoSJ+fPv7uRkRx+suxhvjp7RCA2R2F99Ru0RFP1zt16/3qCpw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzf7eiMFRjy3AukzuuBnRT62U6RYygq2Yw6OffsH5TgwBO2v4XU
 xPGs1w3YmowTLJMdykzli7r+O+1RZtOChpCziSZCbzC/qaC7y8GfQgW6jjn+XSlq3OKYrTG89/i
 PfJf+1TTW4Kii808bBi4IFIKdPR5kOzh1UE2Dt+tOCp9DIaY/Q/5Rj5vZYtiu1Nrx4+K0JtRcaZ
 daU82o7ZU=
X-Gm-Gg: ATEYQzwBjNWGleEsayJDbPTDX3CI1cEIfFkh2cAgUYAk5Riq5Ogan3SOnfNqbF6ZkxL
 FN1B1YQmgmrLDcyknwzd9VPqd0js82G4uCDfOPwqIyWIVuYKp8TccvJSJPuZtHA8FANOMYOnjTc
 cm/wEvemBL63nB58H3YxzHf7wYaP40QWDr2oGkNSPnTp3TLj16xA+gVkg1CB056JjRCMkT3crDc
 fcH9Ck5KUsuhTE0LBCYI5Pmz+DmDPl4sN5UCt7IekLE8v3W8XDaYbhAKozNXmiTk7G3ePfrZimA
 lHsSeiFUKHktxdWz2aY/B3eB9SwpmdDCzxE9j8IyxFPEY7Mr7UPl924+EPJLWCwY6vzIQXF7M+S
 T+7QAOyQPCBMFDceksCLzdAfuopy1Kwe13+Q=
X-Received: by 2002:a05:6a00:a383:b0:824:b1fb:1bc with SMTP id
 d2e1a72fcca58-8299ae2fee2mr760125b3a.62.1772740014901; 
 Thu, 05 Mar 2026 11:46:54 -0800 (PST)
X-Received: by 2002:a05:6a00:a383:b0:824:b1fb:1bc with SMTP id
 d2e1a72fcca58-8299ae2fee2mr760101b3a.62.1772740014226; 
 Thu, 05 Mar 2026 11:46:54 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8297e4fbc2fsm4546974b3a.54.2026.03.05.11.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 11:46:53 -0800 (PST)
Date: Fri, 6 Mar 2026 01:16:47 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aandp3FYSJbwoZxo@oss.qualcomm.com>
References: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
X-Proofpoint-GUID: st8XyrqBvI9scpQuLwttKXQ1uJ-h6z6L
X-Authority-Analysis: v=2.4 cv=eqTSD4pX c=1 sm=1 tr=0 ts=69a9ddaf cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VIWiShEBZmvcmD2q97UA:9 a=Ds3QMCVJO9KgxsKD:21 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: st8XyrqBvI9scpQuLwttKXQ1uJ-h6z6L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE2NSBTYWx0ZWRfX9VYWbohbzJDE
 7ibBfXbPMrvSVALvq3HPva+HH3WPObxPltpyIfYfeOrB5OyfvcnMf5X2hvfaMs7B8Pnw1srwjfR
 XcekhoReHDgwfrRsOYYIXHLDPorbNP0gZqIHQi31JFSuBDg+Lnct7A7M9H9ymS1MEOGj8UXHCwy
 cpP1Q+pA3dBObXSC7JkzZy/s+NHi032J7od4MuGGHWsCzaE/SFm03ObK4o/MMA+CBahsB/aRbQ6
 NRQQbXPee43ESZzrJCUfI2gNT3ihEBnmHdssl4qTL/zLz9HjCA+YJX5G/rEV0Nfu3ygHbRUPFvd
 GLBO5UI/OLJ+RnhuQBUyS4vxgh9RKPnWQqM7mFuOjK8ssg9XhWBliKyLqqbiS4ijF+i+ok2bYIh
 NbFzH2wF3wESoc3NsGd5F9D8Gmi8eJW4gfL5L+k9A7p91otUb29Rb8YKYtpL+wVtN1WA06LV7Q6
 FkS9nNIfKoxU+2F2tEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050165
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
X-Rspamd-Queue-Id: 72AAC217B9F
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
	NEURAL_HAM(-0.00)[-0.825];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid]
X-Rspamd-Action: no action

Hi Russell,
On Wed, Mar 04, 2026 at 08:47:36AM +0000, Russell King (Oracle) wrote:
> Resending this as the original RFC now conflicts with net-next.
> 
> This series is the next of the three part series sorting out the PCS
> support in stmmac, building on part 2, which was posted yesterday:
> 
> 	net: stmmac: qcom-ethqos: further serdes reorganisation
> 
> Similar patches have been posted previously. This series does away with
> the common SerDes PHY support, instead using a flag to indicate whether
> 2500Mbps mode is supported (STMMAC_FLAG_SERDES_SUPPORTS_2500M.) At this
> time, I have no plans to resurect the common SerDes PHY support - the
> generic PHY layer implementations are just too random to consider that,
> and I certainly do not want the extra work of fixing that.
> 
> I've also changed the last patch which prints warnings when qcom-ethqos
> changes the PCS state - this will now indicate in a readable form
> whether the ANE or SGMRAL bits have changed state, rather than having
> to refer back to the definitions in the code or the databook.
> 
> I am hoping that - subject to this working for qcom-ethqos - we can
> drop this last patch in the final submission, along with the
> dwmac_ctrl_ane() and ethqos_pcs_set_inband() functions and associated
> definitions. This will also mean that stmmac will finally be driving
> the PCS correctly from a phylink point of view.
> 

Apologies for the delay in sharing test results. I had some board issues
to work through.

I applied your previous RFC series on top of the two qcom-ethqos/serdes
cleanup series and have the following results to report for the QCS9100
Ride R3 board (AQR115C PHY):

  - Link up at 2.5G, 1G, and 100M is fine (phylink logs below). The PCS
    link takes a moment to stabilize, but after that it's stable.
  - No data path issues at these speeds either.
  - The warning ("PCS configuration changed from phylink by glue;
    ANE 0 -> 1") is observed when the link comes up at 1G/100M.
  - I did find one issue: the data path breaks when the link speed
    changes from 2.5G to 1G or 100M. Notably, this is not consistently
    reproducible, and the issue persists even after *dropping* this
    series and the two qcom-ethqos/serdes cleanup series, so it appears
    to be pre-existing. I am trying to debug this separately.

    Two additional data points: this patch series may have increased the
    reproducibility rate to near-always, and the data path recovers
    after an administrative interface down/up cycle. Logs for both the
    working and non-working cases are included below.

  - Since I still have to test on IQ9 EVK (QCA8081 PHY), I am planning
    to rebase to the net-next tip and apply the latest version of the
    series. I will share an update in a couple of days.

    Ayaan

---
Logs

1. Boot up at 2.5G
	[   10.895909] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
	[   10.905494] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
	[   10.905501] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=289)
	[   10.905504] qcom-ethqos 23040000.ethernet eth1: phy: 2500base-x setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
	[   10.970145] qcom-ethqos 23040000.ethernet eth1: configuring for phy/2500base-x link mode
	[   10.978487] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
	[   10.986630] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=01 phy=00
	[   10.986633] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
	[   10.986636] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/2500base-x/none adv=00000000,00000000,00000000,00000000 pause=00
	[   10.999279] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/1Gbps/Full/none/off/nolpi
	[   11.524483] qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
	[   15.571728] qcom-ethqos 23040000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/rx/tx/nolpi
	[   15.583871] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   15.592285] qcom-ethqos 23040000.ethernet eth1: Link is Up - 2.5Gbps/Full - flow control rx/tx
	[   15.597500] qcom-ethqos 23040000.ethernet eth1: pcs link up

2. Boot up at 1G
	[   10.225496] qcom-ethqos 23040000.ethernet eth1: PHY stmmac-0:08 uses interfaces 4,23,27, validating 23
	[   10.225507] qcom-ethqos 23040000.ethernet eth1:  interface 23 (2500base-x) rate match pause supports 0-7,9,13-14,47
	[   10.225514] qcom-ethqos 23040000.ethernet eth1: PHY [stmmac-0:08] driver [Aquantia AQR115C] (irq=296)
	[   10.225518] qcom-ethqos 23040000.ethernet eth1: phy: 2500base-x setting supported 00000000,00000000,00008000,000062ff advertising 00000000,00000000,00008000,000062ff
	[   10.570643] qcom-ethqos 23040000.ethernet eth1: configuring for phy/2500base-x link mode
	[   10.578994] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
	[   10.587126] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=01 phy=00
	[   10.596149] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
	[   10.604727] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/2500base-x/none adv=00000000,00000000,00000000,00000000 pause=00
	[   10.635960] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
	[   11.166068] qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
	[   14.009935] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/1Gbps/Full/none/rx/tx/nolpi
	[   14.021130] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
	[   14.028849] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
	[   14.037455] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
	[   14.045597] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/none adv=00000000,00000000,00000000,00000000 pause=03
	[   14.062429] dwmac: PCS configuration changed from phylink by glue, please report: 0x00040000 -> 0x00041000
	[   14.071296] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   14.072349] dwmac:      ANE 0 -> 1
	[   14.077643] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[   14.086899] qcom-ethqos 23040000.ethernet: PCS Link Down
	[   14.095640] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
	[   14.101012] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[   14.104778] qcom-ethqos 23040000.ethernet: PCS ANE process completed
	[   14.109740] qcom-ethqos 23040000.ethernet eth1: Link is Down
	[   14.115609] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   14.115616] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[   14.143888] qcom-ethqos 23040000.ethernet: PCS ANE process completed
	[   14.147725] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
	[   14.154217] qcom-ethqos 23040000.ethernet: PCS Link Up
	[   14.154225] qcom-ethqos 23040000.ethernet eth1: pcs link up

3. Moving from 2.5G to 1G : non-working scenario
	[463994.745225] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[463994.760504] qcom-ethqos 23040000.ethernet eth1: Link is Up - 2.5Gbps/Full - flow control rx/tx
						**DHCP/pings work fine**
						**Link speed changed to 1G**
	[464006.855060] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/2.5Gbps/Full/none/rx/tx/nolpi
	[464006.864767] qcom-ethqos 23040000.ethernet eth1: Link is Down
	[464010.370790] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/1Gbps/Full/none/rx/tx/nolpi
	[464010.377197] qcom-ethqos 23040000.ethernet: PCS Link Down
	[464010.382018] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
	[464010.385204] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[464010.399011] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
	[464010.407690] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
	[464010.415922] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/none adv=00000000,00000000,00000000,00000000 pause=03
	[464010.440494] dwmac: PCS configuration changed from phylink by glue, please report: 0x00040000 -> 0x00041000
	[464010.440977] qcom-ethqos 23040000.ethernet: PCS Link Up
	[464010.450504] dwmac:      ANE 0 -> 1
	[464010.455870] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[464010.465325] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
	[464010.465957] qcom-ethqos 23040000.ethernet: PCS Link Down
	[464010.474105] qcom-ethqos 23040000.ethernet eth1: Link is Down
	[464010.479633] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[464010.500532] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx

4. Moving from 2.5G to 1G : working scenario
						**Link speed changed to 1G**
	[  123.351212] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/2.5Gbps/Full/none/rxtx/nolpi
	[  123.360827] qcom-ethqos 23040000.ethernet eth1: Link is Down
	[  126.742306] qcom-ethqos 23040000.ethernet eth1: phy link up sgmii/1Gbps/Full/none/rx/tx/nolpi
	[  126.747557] qcom-ethqos 23040000.ethernet: PCS Link Down
	[  126.756547] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[  126.762525] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/sgmii
	[  126.770227] qcom-ethqos 23040000.ethernet eth1: interface sgmii inband modes: pcs=03 phy=03
	[  126.778814] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/sgmii
	[  126.786958] qcom-ethqos 23040000.ethernet eth1: phylink_mac_config: mode=phy/sgmii/none adv=00000000,00000000,0000000,00000000 pause=03
	[  126.800656] qcom-ethqos 23040000.ethernet: PCS Link Up
	[  126.805951] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[  126.812286] qcom-ethqos 23040000.ethernet: PCS Link Down
	[  126.817748] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[  126.823693] qcom-ethqos 23040000.ethernet: PCS Link Up
	[  126.828973] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[  126.837039] [DBG - SerDes update] ethqos_fix_mac_speed called with speed 1000, interface sgmii
	[  126.846539] dwmac: PCS configuration changed from phylink by glue, please report: 0x00040000 -> 0x00041000
	[  126.856546] dwmac:      ANE 0 -> 1
	[  126.860098] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
	[  126.860554] qcom-ethqos 23040000.ethernet: PCS Link Down
	[  126.868794] qcom-ethqos 23040000.ethernet eth1: Link is Down
	[  126.874228] qcom-ethqos 23040000.ethernet eth1: pcs link down
	[  126.874286] qcom-ethqos 23040000.ethernet: PCS ANE process completed
	[  126.880062] [DBG - SerDes update] ethqos_fix_mac_speed called with speed 1000, interface sgmii
	[  126.885958] qcom-ethqos 23040000.ethernet: PCS Link Up
	[  126.885966] qcom-ethqos 23040000.ethernet eth1: pcs link up
	[  126.892519] qcom-ethqos 23040000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
	[  126.901370] qcom-ethqos 23040000.ethernet: PCS ANE process completed
	[  126.927532] qcom-ethqos 23040000.ethernet: PCS Link Up
	[  126.932822] qcom-ethqos 23040000.ethernet eth1: pcs link up

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
