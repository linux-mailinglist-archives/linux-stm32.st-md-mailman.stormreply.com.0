Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOk8IRbeqWm4GgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 20:48:38 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE40217BE5
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 20:48:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9B17C8F26E;
	Thu,  5 Mar 2026 19:48:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 779E3C8F26D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Mar 2026 19:48:36 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625Hif5Y935986
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 5 Mar 2026 19:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=brQJvLzGSg1FNHbunEnKNL87
 CiKohImsgvm9vmEVnZc=; b=HWRqKTXJDv9CRYuHW6AkxIrJUi7AT0CwdvxIMPMZ
 yAhmVgLfj0z5w+OFNPRT0xQisHx8Yt3UK/+vQxGxX5KP0P7CzKR7LFaCi/rUII9E
 9pgY+Av8R1//h3p6JXQZj+ry8vPl946OxRAVDnma8KigEffmCR1PpKOuMqu1T28p
 PDg1SVQxMnlvDrEdfw3p/0bXfrH9+XV18D9NCZnVbdDjMqzfBfx0JOOtMfYUYNd+
 as/StFXtjiEoONus6618GPgkciGX4LRf1N72Ec4j5X62GOxVZeGIPef4w3N1Vffs
 I0UYBAAOnW8v1wuRjJhwoVBQnLipRjXuOisw+AGegYL+hg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq04u3k84-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Mar 2026 19:48:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2ae3e462daeso27427495ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Mar 2026 11:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772740114; x=1773344914;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=brQJvLzGSg1FNHbunEnKNL87CiKohImsgvm9vmEVnZc=;
 b=RfhbdcRvPFFC7436Pfs8hZiiqAkc30tJHqy2NHXlVqbJrj6WuypqcQgSzU4JwWqBlD
 vDd9OGrmkt2xfnbbENf7jgfV97E7FAc42GuyuINUl9tjB55VNaOoWcsfqMDReHbs49ET
 aoxqj0cv47LuepzXIYlutodJF9pQJzeLthhxwMpeh3pRTkt0xMjloudFLeUSykq1Vagj
 niaEHDWUg5H0ZwD0pIcceuvdXXGmGsnd6Z7odOZFIJ8+yp8v2rFx0Xdw2T9LLSrw8wQh
 vmSMEjBZGy/fcjRqZhdbzu5QgVS7nbGEya8ee7pmC4W0MnmIFpZIMciCPzD588HLVNZH
 Cpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772740114; x=1773344914;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=brQJvLzGSg1FNHbunEnKNL87CiKohImsgvm9vmEVnZc=;
 b=tmdcXgy9KrHPlJjRLBVI5QWYkYggG6QTdS5JOz7ZWAmnJqk2sbS1+bcDbBQV3iHM2k
 nFDLadPdLOOlhRLT/PHdvI2Thg0JAWI8Gj5x048lykAUKNkx/xng37neaxWyTP3stGXo
 3XDYAa0gC8KpHKxG6X2yHATuDMCtbhQdMc1pbJIDE+HkIVOmmIiDQcGEXKgTPy48hA3k
 4w5rD8BJwXxmQDqDy/jqQbw7sJ95ol2mYIWR/IVeI1H5rUw0lsVn6YT04RRwg2A3wjyU
 fIlYrTCNAL7Nqwczt6MsM8DjZ50VVWNg4N4E4xKWgpCEuqU4PB2jwJ3YheJueL2meVMc
 G1Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5tRd4jLPtN1pMn522ozWYRSfWlx/94FRFjmOq/UfHhrQGP+jixN9nStdTjiAm9GBC92kvdty4jSGdEw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YypoVv4O85KYlx2JkY+Rn6thZolX1VPoQpVvwVKzVp3Y7FdMKlF
 4xHjNpezLWYiBCeZej6WcShSRcxUK6u6JMtNNTdapLPd/5YbvuogHYUrmeAf37u39UAVjayADni
 wrc17T2s0MBDnMTdx49HwAqbfCXolP+F9OwIXLW2hTkSyNwwx0TyqBct2IAwlbTyyZGGCRRKyn9
 lSKsLFGGU=
X-Gm-Gg: ATEYQzzuoJAcms4Jq4G8OWxruUjQiCjqat+Oy8mytZrMMvFN1l61dAOMAGAXfRYWWgt
 sxhPIEF6DdtsELMuJi4CKQZVUOIGS4Ze5Ix//AWA+ySuJpujZZb0O7CbrXqrkj0DZ/hqwLC74vv
 VscrmAv1G8OQqzzWS/lHiL3WuoJaN6vD8SLZ4EJZ9v4Wp3M8h5Qx1lOmFsmRPih6oEWuVH6NKeu
 CN2CzaIx12vkgjWtGOyFG/muMBRX14ZRUcYQHhEulZhE3+Br7R+YiWaQqMeawFVlSo7+M8zXjkE
 vzM48N/qpZ2uMWl7UkvAUrtcCRVFNr321OvuTXFd0fUHXMwJZY/A7sUm8ZQyGqRToWKfPXhGHj3
 lr27Z/xIqMaO4QAxlJxZPFJx3mYCNUsEAcPw=
X-Received: by 2002:a17:903:2c03:b0:2ad:ad0f:bbc3 with SMTP id
 d9443c01a7336-2ae6aab2710mr80733085ad.33.1772740114022; 
 Thu, 05 Mar 2026 11:48:34 -0800 (PST)
X-Received: by 2002:a17:903:2c03:b0:2ad:ad0f:bbc3 with SMTP id
 d9443c01a7336-2ae6aab2710mr80732835ad.33.1772740113587; 
 Thu, 05 Mar 2026 11:48:33 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae4dcf80f2sm127371555ad.90.2026.03.05.11.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 11:48:33 -0800 (PST)
Date: Fri, 6 Mar 2026 01:18:26 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aaneCvwkgMOLFsVl@oss.qualcomm.com>
References: <aacD3osfaZkLsGxm@shell.armlinux.org.uk>
 <E1vxS44-0000000BQXU-38lG@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vxS44-0000000BQXU-38lG@rmk-PC.armlinux.org.uk>
X-Proofpoint-GUID: kMArKGBBuDdWYDHcQWlatZEtVo7Ub0Pl
X-Authority-Analysis: v=2.4 cv=eqTSD4pX c=1 sm=1 tr=0 ts=69a9de12 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PHq6YzTAAAAA:8 a=a1qNmnCxCMJs4MpL8WAA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: kMArKGBBuDdWYDHcQWlatZEtVo7Ub0Pl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE2NSBTYWx0ZWRfX94Ht3vcI5E3t
 ZB4Jxr3HTWojwsDPmbOQoVlFjg9ThRJSFOTjzlyFAuY107C7lzsIZhA4nt8laRdC4L8N8kTJiz1
 DbFyCxwrtoXEwaP0hZ0hUH1P2wMmBEHtqDYpg38rHei5C0IwDDQPGFN8hZS3PO1113PFBBZT9bW
 RGRBRIyy493Opo1u34NuIyyUv6hlMasE9xrxtn3XFHdfEHcD78CUeE+Zy1AuyTKQissGZuXCw7W
 8vaUySvw/lJQgna0PCYW72atPpNp+7dGFfNcivw0ivtIvCdMjmrhZ4SUaZ4Z9jH9y2+myEoHiOp
 15HubVbJs1u4Ov6oQauuHB0X/1lUBjJw02dj9krt4MRqjfRPlLCs/Q+JOpLFBn4YgnU9XGF+8DV
 CiL/FHYt6+nr9qYyx2NCMBDMp30maB8ruXzHld9gvhDI0yDsz/JStWTcezFhTwYc7sRzWT+8spI
 4TWCKY6iMkkCrEOrBKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050165
Cc: Andrew Lunn <andrew@lunn.ch>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/7] net: stmmac: qcom-ethqos:
 convert to use phy_set_mode_ext()
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
X-Rspamd-Queue-Id: 2BE40217BE5
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
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.811];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,stormreply.com:url,stormreply.com:email,qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 03:53:40PM +0000, Russell King (Oracle) wrote:
> qcom-sgmii-eth now accepts the phy_set_mode*() calls to configure the
> SerDes, taking a PHY interface mode rather than a speed. This allows
> the elimination of the interface mode to speed conversion in
> ethqos_mac_finish_serdes().
> 
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
