Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHRNBJy1lGlbGgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:38:20 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A81AE14F3A8
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:38:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BA66C5A4C5;
	Tue, 17 Feb 2026 18:38:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D516C055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:38:18 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61HGel9J1601378
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 17 Feb 2026 18:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9Khu6RsTg2hdw2N3mhPZSZ9W
 t5OAieYqZleD6YS06YA=; b=PiBXBHMSNCqQwgLRnydrG3YVTrHMg3v9Dt5jPg4T
 HIN+9sJM3DnR7cIZR8VrhYuaZDNqANZcm9Wkw6R+ko33mqs8RgzahmSeZSYLkc8s
 ZPIM1oalh1dcL5dKZNPSeArk7U3iDcfgjswXPl82oe4WI8GEJS3NzVt74ct7D4mT
 923Agy7keBPoncdbs0sMwNdbBsYnu7P9gtZykcMeTNVc3BdBp8fF7ERrApkjklms
 egYhRZRZ1zTJqcBhqHbnm1YXMd7R13I6l/VxnUwVr2eVcIkA5pQzq/lYE01rZx0z
 V8moE+VUhnCub9TvxjO2xLAmebp6FpY5dvUkcZ77wUC4lA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tmbdur-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:38:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2aad5fec175so177150345ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 10:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771353496; x=1771958296;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9Khu6RsTg2hdw2N3mhPZSZ9Wt5OAieYqZleD6YS06YA=;
 b=Dm4tpHZ+9BqEDAvvwmyTGPAQHcYAEwAnSX42yOBEdEDhQUbbRv9CpOPEmeG8xSDmn7
 QFAGyS2kFZv/lAurJ5rYoxsgWAtDSZzMM4AWxpdBjYHrn2kBLB9sZW3h2JOcEzvtxYYO
 qokzswEDzqsfPjrlHl/R/gCGMW/9JBs//QU6bywIYodgtORcbpBWQQLDMpuMJwxN/mDT
 pUX7mQ6hcnJFVvsQnoRuWSSxZ8Q4BgrMCMBpe9Q90DZHT2z60M4/3hgOZdUlh2OcMnFU
 Vo4vZp0mW3LidSwUehzgS1murQAkT5T8fP9dX5B4p+lZCDHuEp/cvFl4KEfiguXggf0r
 DUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771353496; x=1771958296;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Khu6RsTg2hdw2N3mhPZSZ9Wt5OAieYqZleD6YS06YA=;
 b=JsRDkFlyyEnCHZ3NcnFgJ9QUiURSVcz6DaR7JjESZE6RNVF1rpWYiFDgqSgUBRTKvL
 wfBZrkRp/20hBwSFne1NYUuSR8kDGUwIcZKcbqaqdhtz8u7ML1s1Lljbpzv/FOWgC8PO
 El+LiaG/3hzSzhtysdHiiQ0na7vE9FZNkfsayidqX47rZbTmRA49gO1l1UtEl+o1Hpam
 A609gl6tE6WiOdjpcgoHljqzgLSg+Eto/nt5WYSwRVN2qHLzs8jpE4CV4GF3q3b2HrVN
 vw80kD4DrE8fYOL2sUWUFxeMb+jW37QYeX0qAtmtGj0YaZPCt1F3cYrKEvt5Ks2JbDBQ
 im2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtcg7/9I8GBAWIeCtMJTPCe4JW+imclCs4I0Do9tL4qwa2AGkFhrQPkwQqteNQ82gbamRrF0CUTIrP5Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzdAQvN97G+ndrS481tmSpMlF2wsIzNyqYcIl+drJRFX7rgTbJs
 AZKa+bshXF4NhYkJPUY4AUevsduTNRIgVCr4l0g3shu2Y1GwnJNCa0RM9P+V2Uk1V5KxYKlmItm
 yU2LM5bcBMRdKlNORbyREhFHFaCHUjbXsQelCrqUlLo0TO1bMlyMLtOYZYzQ0YclF4/vZWNyhXl
 0AmFYAJdc=
X-Gm-Gg: AZuq6aL9FqJqCWD76q0DeqOQvc/KCpcy1lSf1/V5ImzuxIrZh5uf6CtH60rdupXTRhj
 QkBR1vPvOIN9tuFFydC0SHMppJjWG5WAtp2x5ZQyUmy3SGayQ8R0Ba2bjRni/+1xJzkYKIvcD2k
 m5dh1jgGFcUCqgzIs0HfWyoca+N1iKRZEOWMXsxu7PjuTX8kejEAtTKH8ddFHfBrRm7BuwgVWU0
 VN3dbCzRaH4rP5fgqUztb9nf8sDCymtTarvaR/7WKh3e4s5zkBO8BLvRnbBWvSowYZCtwFoaoqc
 fTLJnyI9ZZLl23GRUA/jvEpcgiZpEH0lBcp/vuMd6qCLDAO1ojcRzwgDMxIHjEB6yEQX0Gtfqtf
 t2egZQl+1ZVtl0fYEg37hsHO8TNVqYFRFcAE=
X-Received: by 2002:a17:902:cf05:b0:295:565b:c691 with SMTP id
 d9443c01a7336-2ab505173b2mr154968085ad.17.1771353495770; 
 Tue, 17 Feb 2026 10:38:15 -0800 (PST)
X-Received: by 2002:a17:902:cf05:b0:295:565b:c691 with SMTP id
 d9443c01a7336-2ab505173b2mr154967765ad.17.1771353495260; 
 Tue, 17 Feb 2026 10:38:15 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1aaf4b31sm100667375ad.86.2026.02.17.10.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 10:38:14 -0800 (PST)
Date: Wed, 18 Feb 2026 00:08:08 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aZS1kIrwBFdwH8Zw@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPG-000000093mZ-2CL3@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vqKPG-000000093mZ-2CL3@rmk-PC.armlinux.org.uk>
X-Proofpoint-GUID: cBGyY5DvgBhDHPiLnFMcCSAfzGYv46Zk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfX05Y/mGZuCiEp
 3xMIjAtvKh8c1tJi4Le0WIV/TQncCmcHtW5kAPlcf9I6oLl8KRGi9HiGaER/Q7AN3x/zAqO/kJo
 58e71wFYfyFUTRkCnjv5lGjVX2WS1lJDez6FNaQhJVopQd8STDf3axpcMLPpkJWVeXDzlmUmB1l
 iRhKBj7yHU/23TIdY4FDNu/ZmVVFYU96cNz22dNNJY2QUr2lQabVW62WfJdhRvESEi6lfKZUS2M
 HcHGGl3dwi4AeWg/Zf/pjoIwhBAqTNY2ujgdoVlNlB4XyqXoCkhdt0yMncrZBJkr8KKTBJQ+mPW
 8PTv9WS5Rrs+8Sd7kb0wyOeYn6wt88Vb9NCEZCKFNJiuXHeM71IkFH95UPQ8M40MpcAdJQz7w5y
 +PX5WNDB6d97hW+P71EQKB++vPthBuOM71zHN3Ro5tUxUBiFMAvaT6G8IXZ9AODnSLK13uFwBKr
 2nXUH2X/WuwjjPcPN2A==
X-Proofpoint-ORIG-GUID: cBGyY5DvgBhDHPiLnFMcCSAfzGYv46Zk
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=6994b598 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=wi4T-LJhgm9Wf8MEqCEA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170152
Cc: imx@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 5/9] net: stmmac:
 qcom-ethqos: move loopback disable to .mac_finish()
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:imx@lists.linux.dev,m:pabeni@redhat.com,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:Frank.Li@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kernel@pengutronix.de,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,stormreply.com:url,stormreply.com:email,oss.qualcomm.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: A81AE14F3A8
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:18:06AM +0000, Russell King (Oracle) wrote:
> Loopback is enabled to allow the dwmac soft reset to succeed. This
> is enabled when clocks are enabled in ethqos_clks_config(), which
> happens at driver probe and runtime PM resume - e.g. when the
> network device is administratively brought up.
> 
> Currently, the loopback is disabled when the link comes up (via
> .mac_link_up() calling this driver's .fix_mac_speed().)
> 
> Move the qcom_ethqos_set_sgmii_loopback() call which disables
> loopback from ethqos_fix_mac_speed() into ethqos' SerDes specific
> .mac_finish() method so that loopback is disabled a little earlier
> after reset has completed, and dwmac setup has completed.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
