Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN0mJVYjnGn4/wMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Feb 2026 10:52:22 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4CA1743E9
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Feb 2026 10:52:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF4BFC36B3E;
	Mon, 23 Feb 2026 09:52:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B59A0C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Feb 2026 09:52:19 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61N0PJwg3473716
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 23 Feb 2026 09:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=uoHMTBb8IpVzr1yOCWWsa13m
 cN23kWHrFMIDsOYWxZQ=; b=PmD/ngZdTMeiHW3/nGgDiCP5TsITHRVqW170k49n
 qWSXXuUYbS8lzGkkHqw9bgWAqISRDGuhZhQoyRZv1qTDjQUUbYzzqt59myo/93GF
 onCixjAKIX8+8sySzi5VattQbfqINFnRRgLHUNx7clQMLpdaK/nQaQ7P9gY3U52y
 grodMrdOfHlwAVjWtcYHxbciZlYTMjr5Tl3NkKC6V1gr4Br6JIw6nFrUPcTdBHuk
 34McvIGWFAyqHrShfNLOXeCuEeUSi2HiZvPJsuW1tRuNXkuS3P/f1BFW92t5EIAJ
 PE4x30UCIh3SEUWArj5TSV5HlG7TtyeyJjOhX6xC/NDI8Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk46yv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Feb 2026 09:52:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-c6e1e748213so2777358a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Feb 2026 01:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771840337; x=1772445137;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uoHMTBb8IpVzr1yOCWWsa13mcN23kWHrFMIDsOYWxZQ=;
 b=VZu4gRj5e+ZfJfBHRb31eHxQaiFAD0k0Pf0Unl2CFiwsMLp/ZQgZjxdXJGnKcUIbUJ
 lhkwssbCAzm+VKkZly/zShuotHImd7+bpmtNywWgIPtY/FF8BGBOC6z4BDWtnvQXGJwv
 jjJDhG5QMozk3Xrwqyat8IcuQjPQM1UMeQ878qeJlHhfBVTKaAPKC+met/4gk32ZstAF
 jmsflpAKWCGyiyRvvbYDHNdeLYvbg4NBjQkpsmwmOAB/ClWXTdz1bBuQjGzXbzKmr2lR
 9rJ+ppWuLfCrIZ8fAoTkUSg4cg6pQvhHAmOnYfg6PRQCeqrtZbTHKJmQ87NR0SwXMMq7
 6iQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771840337; x=1772445137;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uoHMTBb8IpVzr1yOCWWsa13mcN23kWHrFMIDsOYWxZQ=;
 b=M/GmgrbiFYBiJ0/55i31UR2wS6647dnMXwZMa++SW4JLDHpRdLI8N8NDrRIjvVL7lz
 mDjgc2JEDoKnX9kkJW4cT0tpWV1oO5xQdQ+7GMJoFMCNTvUVzq7vzbV8SGgip4LYyTjk
 PFVmAB2jklDp8M1YFtpuxNCaWyR/lZnxTUuckn/D/X/aIbNrabHICq0nxbokgtZgLbuF
 4yIo5KdnZ0iWTmIy49ZmViwabdPw7j4yfcY0Xq22/rhSber+1VcwZ3+x6UnAImLhtlXd
 yOBPm+KkYH0SY/k4PlKmBK8vFCZltf+LZiTF3Vcvf3cfzxqe4bqd5IWc/6AITCLnzKme
 IO7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJpeI32mXtmZbAC5HD8LQj67Pdq4yl7rApS4RSYDPRsrlgzV4mVb0ePoUeg+iCF90o9/TpaXnvZ6peNA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwyLP6A2ZsL+P2YOWGup0cJY83e7B3O/lMBDlMrIJNWabgzvHYt
 jLhGUcuFDMBnGEghNlZFU4xGwo4fttAa45b23rxKFADO9nnGqgAL4uzzk2P/LKHTpK4JqBSk4EK
 IH3jgsGm8U7JC40k6a2Rzz11fmP9McxzZkcno2CxxkTejrhsB/9xitCOSHtWJK7nB1AxVfPSXlD
 8B4zaoVKA=
X-Gm-Gg: AZuq6aL5U6aVjwApvvK2QWnycdPado5SuzORkc6mW/h/g2XDwRWV5GVf6/YHH7WM4MO
 T8WCyPZrEhl6GvuGkhZrt+eSxqYO37T0F7fsAoOt5RDCFV0KtcbZRMxs7utSx0ZlccqbmStgM7h
 AAz0zfp9pyGeeDc4rt2BLzWXTxvOB6JYQ+6VB9clqNkmp+lR17cqLYHfe8C0SgewX8RZGyxWZ8H
 ZwVEPb716UTjIpgTy5LxSOXvRzonsXFKzA5cM0NgC8nBly6AaXRHQGVSVpwv65qULSZLIPeVig6
 57TV90RbsRH1E38150pwkbjrdPzopkUXm6kvrYAWmntA4y1Og8VYT4t7Uwfq15OQ5P0uQRNGWcy
 WsymJdZUB8BtU4EMp4Y+FW8vv7jtvYJA0nNw=
X-Received: by 2002:a05:6a21:2d42:b0:38d:b865:3a2e with SMTP id
 adf61e73a8af0-39545ec839bmr6508780637.25.1771840337215; 
 Mon, 23 Feb 2026 01:52:17 -0800 (PST)
X-Received: by 2002:a05:6a21:2d42:b0:38d:b865:3a2e with SMTP id
 adf61e73a8af0-39545ec839bmr6508755637.25.1771840336687; 
 Mon, 23 Feb 2026 01:52:16 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c70b71a735csm6444453a12.12.2026.02.23.01.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 01:52:16 -0800 (PST)
Date: Mon, 23 Feb 2026 15:22:09 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aZwjSe5zF1+fKoGa@oss.qualcomm.com>
References: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
 <E1vt3UI-0000000A5e2-0Im5@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vt3UI-0000000A5e2-0Im5@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699c2352 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=4YUTyhlxiuLjCXpWR_UA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfX8cCHhmZFm1NJ
 /zF6G51FJJr2Y0VjmbUrv0HQWzBjGlntq9w4I2ItqRqU3oqXaGm2mzgxBQK7Ia/IX+XqRhhd+TN
 W38qafPjMP+rLDGwGTS+cdiwQo1j0tONUqyz7utrtSbNEGlTjA1/c5TX+onvCbcRG+aGpO+tqFX
 boWPOm8BE4gqE6cWIyBOwUqMS6pIKaCwQ4489yzlnuysiZc7eokCyitu1WKdNwo/oqbQoV2pemr
 FCsH6vksrM3t4OVKXhQdM3HT5pLG+54syqPZt5fyxoosjW/0WQGvO1UaNC7b/KGOdvtbPjTCC5x
 iylV052WjfygxvRs2LvRBhWAaoqBdQj7xtlQ0SN/taOxNKHLsvJLCUl5JD+mf2haU2mCQunURCD
 DW5Bq0r6e03xF1RHKGvAvIim6PQRBgY3ZPYA+JspNZwQlh5RNs0DQsJbAtQYSdSoPZlE/fK6mKN
 Y06ZzicKOp/N376eE9A==
X-Proofpoint-ORIG-GUID: CI3LhNvTq06Ss_5zVn3ezilTHbL0w162
X-Proofpoint-GUID: CI3LhNvTq06Ss_5zVn3ezilTHbL0w162
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230084
Cc: Andrew Lunn <andrew@lunn.ch>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next+ 2/9] net: stmmac:
 qcom-ethqos: move ethqos_set_serdes_speed()
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
	NEURAL_HAM(-0.00)[-0.951];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,qualcomm.com:email,oss.qualcomm.com:mid,armlinux.org.uk:email,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: EE4CA1743E9
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 12:50:34PM +0000, Russell King (Oracle) wrote:
> Combine ethqos_set_serdes_speed() with ethqos_mac_finish_serdes() to
> simplify the code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 22 +++++++++----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
