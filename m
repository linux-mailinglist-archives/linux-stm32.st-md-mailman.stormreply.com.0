Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAqKAiyqrmknHgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 12:08:28 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCAB237939
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 12:08:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 686C3C8F27F;
	Mon,  9 Mar 2026 11:08:26 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78F41C01FB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2026 11:08:25 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6298CUJH2506635
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 9 Mar 2026 11:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=A+vqi5yNfETZAao574uaaCl9
 A1rW1wYUCbmkQ0a4C8Y=; b=Ub24Gv1Jn9nX9rjaOFOGcGwcZdVmHjStc0FyiSku
 Du3qSxRdTTmlVzYgQU52dkfNzEOykV6TdXX3XU2RMK5PpxOOuVmJnJtQTSSU3aQh
 YZzE5Y5YAOPSZz7lIVDB6OrQqEoNTkG7ubqqPSc695WGs8YU5Pf2motMQ+QZiTG7
 D1KjojNEENM+PhejSi1HkESscTsw9XJIGLBnUwRAt8QC8HearsmjoHY4RF7rJFkr
 J0HybVZePW1OirXbbHCjmvNavFwA67/oKKp+MPInfHMVdnJSDAqGCBVsPFAMRvGG
 933MqxunRvncA0CWlIIQtWPjnVk1jtIPVkCIg6XS4I3Ygg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpndfa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Mar 2026 11:08:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-c7396634bb4so13164782a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Mar 2026 04:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773054503; x=1773659303;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=A+vqi5yNfETZAao574uaaCl9A1rW1wYUCbmkQ0a4C8Y=;
 b=Q8aPUKwVAujk6JNjdSWeiy+Qm4VPznIpbb6oIuneTBFe6mftwPgc8ubF/TMT5pOYJu
 m4nPnR0QrbRj60gDSMiMjF5dwa6I3j2deH0KDVTMKWrsav1z9X+Ic3mbfkr+YQx53XSy
 JCit+ghJ9lNrZLTZmXH+y1+se1arzEh7+JX07DAvEFxzpKHkjqV/+GA8uKy5gu2aujaP
 PyctQI/MAu5bEfwxWzPHC1Ka7qI38TDUit+qdEzqOkuIQ3HBgsL3ioI4Rlh4uKOorhR5
 hpjosI4Y/8qByC1bQ1EEWMta3IKKlMSfwJAGLVnz1PqXpMZCKq94dY0WB1PYlTg3S0wX
 3scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773054503; x=1773659303;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A+vqi5yNfETZAao574uaaCl9A1rW1wYUCbmkQ0a4C8Y=;
 b=ra3NDQsWKGTKmjAXUe7uKgo5IFiMbtoEoTP3F8ZsNZw5JyPneDbyE246zKg0gAZgaW
 uV4cGr0sQutBb/OZHrWKlY6a80A/2FZPQVprC9y5JPiQ+45cPpMkw5EZVhOrCWbSE4r1
 plb9CNxMrjWAWGbRThDSYtRFNWKQpXYVWzSvH4PcfmKQWCiMRmiVALaEIlwyEb7ckSqE
 MWRsr15viDiSDzRgKEUGRt3zM7bsA89s9BNkteRLbtSrvEMjFxLvmXKHI02rHlDbPcJy
 AaS/ee4VPoS22le8Tkn7tSskbpBNi3CvrnQsLyl2zpiMNzufOP14z9sPundyKXmPcUKf
 ydfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyCHVV5eeWMHzXIHJ/Z+szP3lgcbphdis6CEdNvZO9TFDaG2e6eF8eXNkK8Lo2KMbXf1z7hAzQv/opqg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz7A2FhqO9IMZ9OprZdcyvV0g+uW0K7+hTUA9/AItaUh3zBcvFZ
 Dd89Y5Nu2NuVhUWy/p9dxOIpOynxv3x5VXzqn3Cx5pqxIO5itkjkamZjT4VPZsFZ4x4+JvBrZuY
 ARMB7blUjvWJmIrKJqxLcok0Ezql0MJbYil8e6jxuMnZ1A2HAxZ+8Iu43g4CxYvoGYpj09ypxbb
 SpggSCAOA=
X-Gm-Gg: ATEYQzyChq7VquKUgxL/VGPpN90nsp1Fw0eMRk9MSKAvH97ZMsryUjyfuaI9kyFu70k
 YQiY9WPSKbZPvRwUbwewFd/BrtAImJd8FTZ9NovoqUzeJU2ODYHaCW87NFrpg2oxZXkCizjAsIP
 QoCScGOFpV6RRadXGKb6hn3ub2NRyATTVTzM7MmmgOuyDJu9XfCyzGWatg7CLpCDQlaGnMqyHjI
 f4bzKSJZhhY9rh2iaJ7kjFGVAKYijHAN0rTUEefSx96G9xjSvvamZfACkrcvbsmeewrCuqJ/xks
 kegOJrT89w4vMuwy5EKs4iMSOyZILpGjHlUq/TUQ044c/B+dcWldZd/CcD7xqo92BgKaXqNRA4J
 CgpZsQ0AFO7Kks7aVaoBtZUXtarULFbTadWY=
X-Received: by 2002:a05:6a00:249b:b0:824:4a22:ec16 with SMTP id
 d2e1a72fcca58-829a2f142fbmr7232880b3a.34.1773054503061; 
 Mon, 09 Mar 2026 04:08:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:249b:b0:824:4a22:ec16 with SMTP id
 d2e1a72fcca58-829a2f142fbmr7232839b3a.34.1773054502566; 
 Mon, 09 Mar 2026 04:08:22 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-829a48dfc17sm11868886b3a.64.2026.03.09.04.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 04:08:22 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:38:12 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aa6qHFVdQ8pvDb+d@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX54-0000000CVrw-2jfu@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vzX54-0000000CVrw-2jfu@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX2AXfzw+fuhPl
 AbcuxuHtlY4YkyrRqigbf4P/llp5u80Iqgw5bDJHsXbPwKN6TN+2CPjPwSohvjlk/zPBrJN+Za6
 9jAXhgJvMDGCieCfhi3xGuwd+d2rvhRz9bum835hhLMYcQiIPoMZDwZSJ+b3JZ2+8n3OvsQsPDI
 Sp1BrWWTYQxYuPtJlERBszyxnf+cypaD/Cv6XquF6vZxL0Ttiyu/1c0PxgX2Ki2hAGtQ/pJmKHe
 lm/NBG5WVFxUZZnVWuo7yItGnn8eK5i0Gpyp1jfszmgThV432X6+iEVjHLOw2WO/2Jq8qqhKg5o
 k3I2CKVkqh6qpThFPYh97rAIFYD1lS3yb2uEULXAtZpx6325iLtKt0hNzwbnevafsMwjgp8BG1+
 Yisw7eioOLbXYzRg7yo9bWSo2mi14fJV4AMATwtEfG3i9tI1hoGsLAXhQdVmq2WXEcsuEVmX0a2
 4wsxYt1m/+RHwSTow0A==
X-Proofpoint-ORIG-GUID: I7QLQUsOHyMK3Hfx0K87QFJ0ysHTANcY
X-Proofpoint-GUID: I7QLQUsOHyMK3Hfx0K87QFJ0ysHTANcY
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69aeaa28 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=EL_Z8gHO3nUhwFgt7b4A:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=bFCP_H2QrGi7Okbo017w:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090102
Cc: Andrew Lunn <andrew@lunn.ch>, s32@nxp.com, imx@lists.linux.dev,
 Yao Zi <me@ziyao.cc>, Frank Li <Frank.Li@nxp.com>,
 Eric Dumazet <edumazet@google.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 Chen-Yu Tsai <wens@kernel.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/7] net: stmmac: provide
 plat_dat->dma_cfg in stmmac_plat_dat_alloc()
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
X-Rspamd-Queue-Id: 0CCAB237939
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
	RCPT_COUNT_TWELVE(0.00)[25];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:s32@nxp.com,m:imx@lists.linux.dev,m:me@ziyao.cc,m:Frank.Li@nxp.com,m:edumazet@google.com,m:jonathanh@nvidia.com,m:linux-stm32@st-md-mailman.stormreply.com,m:samuel@sholland.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-sunxi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:jan.petrous@oss.nxp.com,m:linux-mediatek@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:kernel@pengutronix.de,m:davem@davemloft.net,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.562];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,stormreply.com:url,stormreply.com:email,armlinux.org.uk:email,stm-ict-prod-mailman-01.stormreply.prv:helo,qualcomm.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:39:18AM +0000, Russell King (Oracle) wrote:
> plat_dat->dma_cfg is unconditionally required for the operation of the
> driver, so it would make sense to allocate it along with the plat_dat.
> 
> On Arm64, sizeof(*plat_dat) has recently shrunk from 880 to 816 bytes
> and sizeof(*plat_dat->dma_cfg) has shrunk from 32 to 20 bytes.
> 
> Given that dma_cfg is required, and it is now less than a cache line,
> It doesn't make sense to allocate this separateny, so place it at the
> end of struct plat_stmmacenet_data, and set plat_dat->dma_cfg to point
> at that to avoid mass changes.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
