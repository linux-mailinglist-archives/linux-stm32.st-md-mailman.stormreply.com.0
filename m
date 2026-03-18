Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAcIO1ggu2lofQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 22:59:52 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBE92C3343
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 22:59:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E796C8F262;
	Wed, 18 Mar 2026 21:59:52 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 830A6C87ED8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 21:59:51 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62IFgZ4T1928630
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 18 Mar 2026 21:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LBQfztnTegzW29zYjO4bRrqA
 t8SvJ6u0ZfA1KTQ6Eng=; b=ImuPffFzh+izuKvoUtZOB0iA8+kgAAkRr078s41T
 ZD/M5cof8k4lJNIXOExcLiZM5Xbb4eXkDorZ0rlqdBZb28FfgPX0+dA11ZhrLzcy
 z7X82mLhzRXB0vyhPBE8YsUNkA4gINaFYLVyP372flfafTqDlESBCERgzP4xl1Sw
 DAexbPokk+/dHj1rzkcKx5/LsQ07J6aQ7L/GLIxaX2Yaq2pk4nMSX239Qyi31xb8
 LF3Vt1G23Usi0uUJF2wzdcFQnMYLsNeUM7Vu9sUAJS/aNJszlqk/9bU00B7v6MX/
 nD9fVQgIkr65NBxzhCd+ciOnqKHcgMdZnd+v72rxst42DA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyut1a2ya-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 21:59:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-358f058973fso666628a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 14:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773871189; x=1774475989;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LBQfztnTegzW29zYjO4bRrqAt8SvJ6u0ZfA1KTQ6Eng=;
 b=kWmsKCsSk6Y9vQ/ANe4F4QSZX7gZcDx/Bb3dh1vzeNX5LxmaZpKSe7wWneV8ZdAVB0
 n7JQNlRPBZ/i5V65wx6TEAMm/goNjWLl8yBn1cn68W93BscG5w8LTwF5YsXJWZaPSN4d
 1yHV8O2pd6aZcTLQznypPvmDK1/HY4A7xz/u/022knf0FazwK5jUG54WaAJChKbYdTSo
 tHF431Gwz5bzXVwmk5z8KSq5KE+htyfAt0ubueGBkiGetdY+s1cnUHDtCOlKV27lZdWQ
 2Wj0TEwiqTlAi8sNm6EuluKBJI32MVozd6bJ6SdqBCH3SBB/obgsaj1OXLrnP8HT9p6a
 PNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773871189; x=1774475989;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LBQfztnTegzW29zYjO4bRrqAt8SvJ6u0ZfA1KTQ6Eng=;
 b=HutWWGUBav7lU9yD6XcKI6qvI1w02cGinkwcNj+oGROPVHfb9yldcltsaymKDM4Clb
 coWYsmwMPSXJykeqoUWumYHp509fZeZXksVeqLpqEYvW5HOLMc31k8qlknWrCSWzcExQ
 9zwpR5doT9RKuLRGGq3yHFPstciOKhW3Ca9PO1jc58pqCfzh0K1uSjb3Rlc1LC4QPjST
 a52KixSrJXF5lPfQbqq7k8FkwuE8XLynSdCouNN2i5pAOLlltLmVu3Ioax+FNdC6Ozxq
 U3+srH/fjyDKFVa1zdmanVQbNMtbcj07urG94Ch8xyL4wi+76bqPtE1ie/JPtO2OmWSs
 7UPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8qcQFVvy9inNl2HlavGv9U/D1Al1cvS4BetWd52SMVTs/KPD6edzybWNRUpUxrzpE4hiBfRLTRk+w3w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxO5lyjlRqTkkrVfLV2ppjFajq69/+IT8KdDYqSi4JSRZQ7HlMP
 5c6AqVf8oLmDbHZzHKi0SvPhBygfQ+zy2NZQ/5My2/vMULEVTl1lft+AwlXlNE6lnsF9aP1hfiL
 T0X58O2IssigkoGfcTTrZNMKxT/uus/uBMfzuKa95FMQt4m+oiShp1sVAI9SQOmC/bs/qFnxLfy
 /vRwaBAhO0osKh2hq7FA==
X-Gm-Gg: ATEYQzycKvMhL+8lrLlBoELJXWludgD3CqzcZoFmOKpXd33+wsANxXPsYhmBbL4QhWJ
 wg/QccR1MOKKvLAaiJmjjg0VFJ9ct77qLoEpCKAwQVnkFP0J9bOp/YQ+NYsdsPje7arfY/DrYrE
 ur9qOEDgFot/R7DQlFqC5a31oftP3Zb1hRakO+hjZF0xCtoWvqy/eDy/IXVZ5n+BXm0OOwcnZoH
 j9DpcwLD15hPIO44XZuXwHcEWL2eL8Lqi9heH6fd28oh1VHseT+D0LDC+K1yE0ivWd8chWJYUB1
 RwLvpne8GiMCkfvvMSWxQEzddHxlCecxIAAuUIrx2nvnx5DbkA4ONK+J1UTe3fpHTjskVDX22W9
 rB9FyhcOpXPbIfzxk/s4Z/hsMqKLFfEJfwBU=
X-Received: by 2002:a05:6a21:1343:b0:398:9ae9:7110 with SMTP id
 adf61e73a8af0-39b99cb7f07mr4358082637.11.1773871188666; 
 Wed, 18 Mar 2026 14:59:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:1343:b0:398:9ae9:7110 with SMTP id
 adf61e73a8af0-39b99cb7f07mr4358071637.11.1773871188066; 
 Wed, 18 Mar 2026 14:59:48 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c741e0dfdddsm3291363a12.14.2026.03.18.14.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 14:59:47 -0700 (PDT)
Date: Thu, 19 Mar 2026 03:29:41 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <absgTcRS+JAdBs3H@oss.qualcomm.com>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <abdEscs44fU4kRag@oss.qualcomm.com>
 <abdYu864OmNWiWIW@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abdYu864OmNWiWIW@shell.armlinux.org.uk>
X-Proofpoint-GUID: 7HZ4lYcYvrvQ2rgfbZ-Yr1FBi5DSGaCF
X-Authority-Analysis: v=2.4 cv=ModfKmae c=1 sm=1 tr=0 ts=69bb2055 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OIreufjBPOA6zABoq-kA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 7HZ4lYcYvrvQ2rgfbZ-Yr1FBi5DSGaCF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE4OSBTYWx0ZWRfXxL2qkYYF3yw4
 zFNz1uf8Y1Zhda0wzViclZ5ISCrQ6O5h+Kg/XEFkJRQBoOwhlQJgatW/KsnZTo/k52wa9rrZ7wL
 QMXxrTGScVz5OVaVpUw73eyLor3xxeIvbTUZ+c0i/DtZ/xLp7wB/2NmETrn7zBDPDr7W4iYk7n9
 thzGFZaCZc5JGubQUQqAT3GPWzXlKZogGqMYyv150XcLv/BmDMfWVof/0WCfl3uPOSCOaYYJGkg
 1QGyIyKcpxDQR7z7gEJ+69XsXQ+llqOa9WnWLCJJhMUZSePYfDl3M6+K45pqZehZ9R4sGV1LF5Q
 RrF2VirKkHBNd1AxrOWP3nFY86EUfWnd0eYfABLVPX/TPUGsUNSG5uwbdtJbTeBwPfuEYuq2o7m
 oa9qGguTrsfvnPNN1+OSI6JV5+g60Hz6Fjd/osWune9icS6VKI67A3C+mu6vP4lkbrqMlWpilMR
 jAUwizA5b6yxUp17S6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180189
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
	NEURAL_HAM(-0.00)[-0.418];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 8DBE92C3343
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 01:11:23AM +0000, Russell King (Oracle) wrote:
> On Mon, Mar 16, 2026 at 05:15:53AM +0530, Mohd Ayaan Anwar wrote:
> > 3. With the recent VLAN filter changes in net-next, ndo_open takes a long
> >    time to complete as vlan_restore_hw_rx_fltr() tries to write filters
> >    for all 32 indices. This board previously timed out once, but now
> >    times out for each index. This is a separate issue unrelated to this
> >    series but I added the following workaround to rule out any timing
> >    issues.
> > 	--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> > 	+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> > 	@@ -158,7 +158,8 @@ static void vlan_restore_hw_rx_fltr(struct net_device *dev,
> > 
> > 			/* Extended Rx VLAN Filter Enable */
> > 			for (i = 0; i < hw->num_vlan; i++)
> > 	-               vlan_write_filter(dev, hw, i, hw->vlan_filter[i]);
> > 	+               if (hw->vlan_filter[i])
> > 	+                       vlan_write_filter(dev, hw, i, hw->vlan_filter[i]);
> > 	 }
> > 
> > 	 static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
> 
> This problem needs solving, and I suspect we need more than the
> loopback here. It needs detailed information about your hardware
> design, and comes down to the missing receive clock. stmmac is
> unusual that missing clocks affect the accessibility of the host.

I tried finding more details about the hardware implementation and
it appears that the receive clock is sourced from the SerDes PHY.

As an experiment, the following in __stmmac_open() avoids the issue
on this board:

	qcom_ethqos_set_sgmii_loopback(ethqos, true);
	stmmac_vlan_restore(priv);
	qcom_ethqos_set_sgmii_loopback(ethqos, false);

What would be the correct way to handle this? Right now, SGMII
loopback remains enabled from qcom_ethqos_probe() up to
stmmac_mac_finish().

	Ayaan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
