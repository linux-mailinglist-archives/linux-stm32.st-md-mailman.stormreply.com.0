Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAXGFfdwhGnI2wMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Feb 2026 11:29:11 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2324F14C1
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Feb 2026 11:29:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89B68C87ECD;
	Thu,  5 Feb 2026 10:29:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6BCEC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Feb 2026 10:29:08 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6153drCJ2103211
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 5 Feb 2026 10:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7XgVQgH5FytF8RnzcwtnZGEm
 theQcG/boixIGeEwwMg=; b=IqoVJ+Ywp1NwX67gZQldLM2edKO+gK63/kiAldlL
 yGRfOw4bXyMBlR7nfp4Nv3ppUMZiDDEFk8dIMMbx66nZKrB935FoEXUoJ2w+D3/s
 BcLDC0BUTr8eOTMuXUmgDaHdyQyt78M0XwEA+DYEZfade/mPb1jmCZj8RHGqx9vj
 mu9XQkL3IEKvNg1f7dMCkkhN8WysFv8UltSG87KBCzFTTd4dB628tBEAVtViozzx
 BqjoTLX+bI3MyfXLhl7R6LH0PzXKQPQFPEJ0G8p+KfWnPOc3wNJetjAZ+pcol36t
 E6nQE9rnSbPPNx6UFWvhopekG88Jt62+mCTdo8q64NFVsQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44xjkxr1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Feb 2026 10:29:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-c65d08b623aso668536a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Feb 2026 02:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770287346; x=1770892146;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7XgVQgH5FytF8RnzcwtnZGEmtheQcG/boixIGeEwwMg=;
 b=Pi4Lh2xQa6IAioBjL89nFeexrQfK5i81wngDtAh4V13c1CiZUA5ttdS1Hx+FYT5FXD
 BTU6xszYlCLgx3XRNthp0hBch0E/BamhbgAvfZMRubxVpV9sa/eJf7GdxNObR8hewP2/
 JfMVkk+fSMvqfTsSaAA3IUnEMLa+4ZaeAB3XDyu7Jg0kcVZ0AuEZ+UQoz3UDFXlmnd17
 DKquAzzZ/xd+8z6tQBBmR3TGqYuiw9sJYPv9L14R1RQ5NBKEy7PEqOpak3jHvm45l5Kd
 lqR6eiZNO70GXVVNh3+Le9iytnq4YYjQQqtr+1DIgNm2+W+35VGmtEoQ3a9hcCX1SEwB
 nS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770287346; x=1770892146;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7XgVQgH5FytF8RnzcwtnZGEmtheQcG/boixIGeEwwMg=;
 b=hf8veGxRCB4icOOb+620yQuKC+/YCx3R5p04hUYT5DLxvAgAYZk2KoADgtdJQ8Qwlc
 tgULvAy6w0q4hyHKlzNnuQIRQbnB+4myApdmqYZSHtOxnzGEunilqVfwYMVTYoAkaCTc
 fqYGQlRnbjpskPNj8hIC1ENMFQeBmgXOCjsQUm3Jls4lKKQTzunkLkNuRkKuYQGCc/H+
 Omf9Kx5DXdDEslVxu6caSbAMU4MgpZHoAI6pNYc1IzMvsfjtnwR91jogw9QOlo9vU9Vw
 fSW+saSEKtUoaYeycRM1/NTz1JZrsMpMIEyx8zaPnJMACdLTDVJ1bMuDaGihbSg6qd/r
 sepA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+QIiDCAEYj1/i49Z35ZpT/QYY999dkYQ1BiNEkfryN8qUpcArpxXS0ivvpEWB8QskYz5W0AmsA30dWQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyhWl4R2r/Nkmwy3cRzfcGzQNCXiOmkH4pH7zErlTRTpu/wINzS
 /QEzDbpkIzNNj0JMA7huiCmS134EfoDLSZmst4WfHbZHvhz9Qq4QmDNkhlKrkUTyAFs1qwv6ES9
 DR8WP3k2TWcyuz/IeSYxk2+BE9pbj0RG5iR2PojwBKbgj3QSj0pqkYv3l832y0NxBVn2HOepmjR
 5Mh5wIOIAB/Hgj82E=
X-Gm-Gg: AZuq6aJ46mxOktfUlzgQ3ftOZsfYXR11Hb+oJzckzYNSw8dVStmMtO3AXXr8hLzMhi+
 Dg9vNAoUGHlo46uCC9LLmLHrrxOZS3W77WL6TLWbHV+WbicJVaMbu0NBD8K4zlvsYZ+8ahMdMB3
 oOmp0bMIXtLoZ/EYoZUi1Cz6aJIdVUVi1SKF/vZVi2563I4SdXb4MUgvrm64gtAxEl+ZkwAB5By
 t1YLi0UqH/Z8HLdd5kTJk16eYbeYRqgckjgsiSNh0hNlHlgKGd/RhxyAfcM7X1EH0o7axoeQitw
 JXX8nNTYMq0nPp6dKoQs4nVa2xdO/92wR9gtPcWTD95cdCSZ9dADGQaKIgAYvlck949g01DPgOn
 hZEBQo9a6B/VeqCLLM/s1jSU=
X-Received: by 2002:a05:6a20:3d8a:b0:366:1917:54cb with SMTP id
 adf61e73a8af0-3939025841dmr2317130637.3.1770287346158; 
 Thu, 05 Feb 2026 02:29:06 -0800 (PST)
X-Received: by 2002:a05:6a20:3d8a:b0:366:1917:54cb with SMTP id
 adf61e73a8af0-3939025841dmr2317105637.3.1770287345619; 
 Thu, 05 Feb 2026 02:29:05 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3549c09df19sm2040354a91.1.2026.02.05.02.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 02:29:05 -0800 (PST)
Date: Thu, 5 Feb 2026 15:58:59 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aYRw6xSvEYmpWnSs@oss.qualcomm.com>
References: <aYHHWm5UkD1JVa7D@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYHHWm5UkD1JVa7D@shell.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=DtpbOW/+ c=1 sm=1 tr=0 ts=698470f3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=spYx4npwnBwiAfMOhkEA:9
 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: EHADttm-oJVZuW0whmhsj0ygzsZeTqT_
X-Proofpoint-ORIG-GUID: EHADttm-oJVZuW0whmhsj0ygzsZeTqT_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA3NiBTYWx0ZWRfX/4/LpK9XwdEB
 rTYjNj9fWbVbtIqTcFjgwOkmUhts/aU2wZdhbFyaywBiB2gbX5ug0BuEUvcD8OC+GaOhNYvlyOI
 h/jV7UucfPeLx7qQoRViF4IoLh0HSkMalP4H2jlzHIOPqDLRJz9+kWlOxlFBuP32lsSa/yfszWc
 NCPzATaEo3VIiHsS6gZkspF+bO5SPQVDumr2hrSiHv475iCxUnlYV15QTMvHn32TCwj7YWgfpwZ
 vsIyFElGqr6od3uSB5nzCmh1RCoohz5CeJCNK3iOqZ3FCVx67kM709/EDTzveFbcxNeuQK47MnC
 +qQbEzOT3bJiOOlctO5UOnRo8d6wxMG4zjrVuGnv7kby4o0qTafImxwW6nJjIIjfew8ddLI3WZj
 htqv7pKzkRkvDmkwo7KlxwONpKd+JcUIl+WPbklUBB1J8CLTgZ5Qqd15pK6At6bCrS0yY3WkOhk
 9mn6fZ462OD/u0bhB+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050076
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/4] net: stmmac: fix serdes
	power methods
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
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: E2324F14C1
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 10:00:58AM +0000, Russell King (Oracle) wrote:
> The stmmac serdes powerup/powerdown methods are not guaranteed to be
> called in a balancing fashion, but these are used to call the generic
> PHY subsystem's phy_power_up() and phy_power_down() methods which do
> require balanced calls.
> 
> This series addresses this by making the stmmac serdes methods balanced.
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 65 ++++++++++++++---------
>  2 files changed, 41 insertions(+), 25 deletions(-)
> 

For this series:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
