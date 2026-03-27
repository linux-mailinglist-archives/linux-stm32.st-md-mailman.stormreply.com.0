Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AJuFEagxmnrMQUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Mar 2026 16:20:38 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D38B03469F3
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Mar 2026 16:20:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E460C8F288;
	Fri, 27 Mar 2026 15:20:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1A71C8F273
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Mar 2026 15:20:34 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62RDhEAZ3748031
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 27 Mar 2026 15:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ss76jAqWiuezivNC5zEZJoYk
 XwE9ZyVbXGzY7OaUfHw=; b=aI1ApZLNF6MrFXweEsidasxUME6VrN4llo6ogWgN
 FK26tugsLvNNXbScTkuQxxJ2x4CAZq4hGVyXHc0Ny7LsJNqyJ8xPfYg468Kktf7V
 poPtCUCMXryEgglpwszTeSqDlXL861NbWRnYNHMiGlznpEXSgMY7tkrs3azJsRso
 0HRi70nfii+izCGIY9q05lXNSco5rCg5mrvCJ6lXbc5lKRbY5R7OKFc//35xUJfi
 mJVnF7SoOLs7tK4tz8dTjqpKut6HGHGPRAntsOlrRLGgpKuiDMWZdemY+T+2WHi/
 NafbzFBBLmEo0jdaQXioYR0rK2HnJOSSBGhiah1xIND70g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5sxhgk25-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Mar 2026 15:20:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2adef9d486bso44834515ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Mar 2026 08:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774624832; x=1775229632;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ss76jAqWiuezivNC5zEZJoYkXwE9ZyVbXGzY7OaUfHw=;
 b=RnpCItPOSWfwLkwEiL8woiouB4c7vkkpmvoR/nt+mzT8NpIEpjVjZw7Fpced0n+Pnx
 ThTNcDLhwTWm5aEE2kx24aoCujPBHEC7QPVNAslvjeOjxZkFB1amxpas+r7relkZ+5y+
 WXooXYp1yqu9vXZFm/Xd5i+CJNa5MFdY5hJuDSfIMWySbWvvMMGKgFlC6j6Wqpor3aJJ
 o74X0kP3D6XKYo2n/8PYgC/T+zB7lsE9xgie830p2AqO6qROQNSe3A4/j0wOWnBJYXiK
 mRexORhz7NEmI56V3rLM7KGKhn9UGkMWoJyzoN3reKykoPnf/qJUp+jPgBQ3fZFbu3GY
 DUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774624832; x=1775229632;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ss76jAqWiuezivNC5zEZJoYkXwE9ZyVbXGzY7OaUfHw=;
 b=AEcZ2hDnKvOGwtYKISlc41a8Nbc3xsrb16LNTif71xEkQWNS5bMYoF55UysT4PoWoc
 BFabn+vC2/miBkdrRuZi5aKl+W4XiiE3CpV/K+YGy0kB3fisgHeWACWE4S7vuJdgFvyM
 1AUVlMgMgP6P/baw5uHIr9z8G/H7l1+rodTdDUi9wtVdtjqexwqqK7XpwCvAfJqjQsSX
 IkPppHCcMTmv/2G6yADq/2EZ/1dRUGKOhSx++fxtfPizwtnz+IGluPsBdV0zyDmPMTnm
 aftpfUPiUFyzFxn8e5JAOj+2zeOeNl2yExu/GnOe7qEI20bwUhUSXo/IWIXvBFltXpag
 NR+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEwLZiKt2Wx31OkdcZEvYQZ5/be4immLLzgcWTe7s1LfKNgNKdv5Uqj/5sH7L0w5i33vLc/u4rvL3kVw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzt/XGLZpTmPAAMucrwQsm7oOQQuUCEM2soPPrVM2ci0x3MLn7Q
 EfpfTAb7nfG4rRjOc2qyGWOHY+hYqf0gSOKW5yNv+kMwUV/9W+60d6Ouxgh1jcsqdY7Bdm6MHHM
 QfgZUHhXef+AehwGUzAlPHyJ2PUKWS3wqUWJuctBPFSgVhenlGzoZbSGI5jLvWtAn1lWr0ZasP+
 9dKuY46mA=
X-Gm-Gg: ATEYQzz+NDa2yj+x4dT7EMEQmVwFQg8XyBIJIECg7d1jNUKUJvju61gA7IGmE6A2rqT
 YUVHeuRaQJ+iY/d+5pRXENKdcn6/2bYTUa0sEEX0/XXpnDv7EimnxS4st9DJDfeXfNRIvDgaN6Q
 GhwmXUy3N+DJOKcAecuL5hD6OhNdXGvhKBD8GpNRTU+1E8Fzx7T9EI+W8HWiuFFrZPB77XuTVFJ
 hlY369H2uMEwYXP7gMC4BjB597PMLPSVLaeLgbLzHMoaKXvtkxMDfevtjmwFuQ70JzvqDkva6G1
 T+QEyXdgQ1++8t9H4akohE6b8/3vR0Co/BGIlzCwhLMUwllS+K028wBOaQ7JILclXA5R3FECx2Q
 xPrLRdhjfPW4j+AFJuBCry60SzBlfvKhL+rM=
X-Received: by 2002:a17:902:ecc4:b0:2aa:e3c7:6048 with SMTP id
 d9443c01a7336-2b0cdc4357dmr31891855ad.23.1774624832329; 
 Fri, 27 Mar 2026 08:20:32 -0700 (PDT)
X-Received: by 2002:a17:902:ecc4:b0:2aa:e3c7:6048 with SMTP id
 d9443c01a7336-2b0cdc4357dmr31891535ad.23.1774624831727; 
 Fri, 27 Mar 2026 08:20:31 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b0bc8fac97sm60839905ad.71.2026.03.27.08.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 08:20:31 -0700 (PDT)
Date: Fri, 27 Mar 2026 20:50:24 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <acagOODP2QD2xJf6@oss.qualcomm.com>
References: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=QZVrf8bv c=1 sm=1 tr=0 ts=69c6a041 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=j9A04r5R_e2Fnr00k4AA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: VULrgNM3VmMintAJzdxq-_VoFQCol0uj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX/LeTg5X2EYwy
 a3cgbroWE8Hp7msHhyfgpy0Z9GBPoJNd6Y+l0mako1JIuiiYWwl/gl6Exhbx0aTmImke0Kl+sA8
 ETJ0ggaVjGnYn6UNlZkXpBR+yiPO/ioauLI9I+phfKwlHtbNBTrB+GXyGvYzx+4kKj57T/B1EzY
 6lI7ntK1HCHfGU/NJCurNHQ34XGx5+vOjfAROUTNXFV0iy7laXzbo6lm/SGN9hgkHQIoq/mtcxP
 6SZFLOl1/lJ0aMghXe3HqkRqVjyd7HqMGnQG5aMA1TWTfCZYMKHUjUl0H63r932Nmiulp9c/o1A
 2gFtRYGoMtdn0vAkoKne0AUVreUNybAB8rpDTz6KF1wnHOg+kp0Il/edwsbAD4QotkbUGbn1yRf
 wewneuWnvUW8JMvTjxOo9MiX+ltyo8SKxmKOdKCf1U83Sn6n1MRcPMzxdwBRL1brcWUQUT0MdJM
 DUwyrTs/0g5yTxNKprQ==
X-Proofpoint-GUID: VULrgNM3VmMintAJzdxq-_VoFQCol0uj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270106
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/15] net: stmmac:
	qcom-ethqos: more cleanups
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
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	NEURAL_SPAM(0.00)[0.078];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: D38B03469F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Russell,
On Fri, Mar 27, 2026 at 08:42:58AM +0000, Russell King (Oracle) wrote:
> Further cleanups to qcom-ethqos, mainly concentrating on the RGMII
> code, making it clearer what the differences are for each speed, thus
> making the code more readable.
> 
> I'm still not really happy with this. The speed specific configuration
> remains split between ethqos_fix_mac_speed_rgmii() and
> ethqos_rgmii_macro_init(), where the latter is only ever called from
> the former. So, I think further work is needed here - maybe it needs
> restructuring into the various componenet parts of the RGMII block?
> 
> v2:
> - patch 2: fix typo in commit message
> - patch 3: fix ethqos_fix_mac_speed() comment
> 
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 220 ++++++++-------------
>  1 file changed, 87 insertions(+), 133 deletions(-)
> 

No issues found at 100M and 1G on the QCS615 Ride board with the KSZ9031
RGMII PHY. As noted earlier, Ethernet support for this board is not yet
upstream, but I have some local changes to make it work.

10M could not be tested due to limitations of the link partner. But with
100M working fine, I am fairly certain that this series will not
introduce any new issues at 10M.

Please feel free to add my:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
