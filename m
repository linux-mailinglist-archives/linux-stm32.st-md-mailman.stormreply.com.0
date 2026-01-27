Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFsxMGrBeGn6sgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 14:45:14 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC27950E8
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 14:45:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD92AC555BE;
	Tue, 27 Jan 2026 13:45:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D505AC01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 13:45:11 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60RA4Pbk171390
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 27 Jan 2026 13:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+KoxU3lQMnCDsUz9/HEPI79F
 t/PTbWYdpT8UE6jWc1A=; b=o6wilfU5s8bXBP2STeBnmiA5I6XiJBQj4RpvUpkV
 f4dbXpJVC7BDE73HApnOeEld+tHX/9A86npskqVnIGxMN7IgF0AtibhiEnWvzIbv
 Zm+xbx9TiS/ioqvKOF9qWjK2UgdAvgI3fH07qNBbWTZMiUMB0NB+cSx3iOsC3Edo
 eRN7hrjisUZ3EfUHvN0SHzx9f8Ld0O3qcCOyUm9+UDO+EkzD+azxzvqqmp/OX3Ue
 KYBpq6y1CS9Basa96vDqoJhrtx3xho+UanRP+1CESf3CIRxdgUtUpGWU0JW4ck1K
 ah3R105tTpnnhcjx8jojyw9xmGbNJXaTI/ujT2fUequbzw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a2yyj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 13:45:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2a784b2234dso15271725ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 05:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769521509; x=1770126309;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+KoxU3lQMnCDsUz9/HEPI79Ft/PTbWYdpT8UE6jWc1A=;
 b=L95iN0SoCfZ+scwJf5CQa4AmMBI3iWlhdoHZEW7kH2WnGBZS1EfvW0eIeRVFVGHPqv
 oR0RmtB2GSsWDS1u6FV5NwPcHo7whxtOAM1qwnYowRKzaze0SvM3HlgKhZnIlwi9ZaL/
 JTVms31M4SERyuWi9I+BLzewLyG+irR6ZsCS/NxOjOhw65WL45JVdDzEp+H+G+SlVcaE
 LJ/Panv/2itrc8CKorG+a7WYRTZpAuGAKNK8cQUQrTR5W/bDtkihenSZU/tQQo/9DtYM
 t+HsQUmFrI+VN14cY9bKMbT4ZHO0wNCetHIQC8/rHp/e89LcW4FxK4ajGQlQt/BlSuMe
 p2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769521509; x=1770126309;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+KoxU3lQMnCDsUz9/HEPI79Ft/PTbWYdpT8UE6jWc1A=;
 b=XZ1So3SGEvJN5EcssvBsy8JargBHloTYUk5Z8obVb65KkGQ1aCeKJuIy2pY4yHTdbO
 VrEb9YheiDXeNGMu3fAeM0YQ13g7Q23PbodhMKRdhXVc0TXeHQClxWP3jHSuWy1YpVJA
 8PhUx8ah+J7Z/4OSBR2AEsLcQHoASSE2pOy4KcWojC5ED4kJgHcjEX7OAfQmcHKfgjV4
 7miywLTmCHI9IbE+NXT5kVQvfPrgwUPuS3lcWHR8WgaRg6oHHKTgrLz/GuAxzgRmHUs6
 Gn8Hlmk2ZTmB8s7dd6Wt+RwzjJzvIpRXHDx2vEGa/tYTmj/KUTjF6KR9WtiGRfWElMT+
 7Ppg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8e+QWnFqNhuP+Jv8TSu5DuHzoWAQUo7KLoaCszd2VDxuRs70uFihKkAufpnjiYnZK37Ksw2lBErKDgg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzud711itBBmZneRT4RCPC7Rc2WrAFmreuuocjMqrcZ6E8PnYHM
 EZkeW9x5R3YAgfZP0+vPvHSS/IdbpukJRyTfbZmNKd3i5fei3qREdxEUN990MzEvlDOgQcXEV23
 pyR+dNeSJC4eumjhSXQ29rGEIxfi1lPFyGimjrfrjiYyibTdmDfad1OUCrUIyA0DLvxui6+Ji9a
 7ZWbELZwk=
X-Gm-Gg: AZuq6aLhADDAAgDQF67cM8DL3hRxeZlQuNghCKgHdmjgmghKL/RgDf/QYcG4hu1wjNY
 dUuIRC+7e6i9pmlwQ9UeEinXlVEtuSMOwtzqIS3Vtm1U+HSBlEms9dLG+eoQPVjyU0Ib/NvPyzj
 ZPsIYmMahVvRpcKe4TJjA1RFCM1TQwYTwppm1OqinOcUXd5l8qk6QsMKXfvj8jxSUj1IfPdxGOW
 2F3dNygfFdqlAEgohaHsqLz+c5UGysR3pbKpzCHCFALjdPmR0f3tViSbLg2+OC34AlLmHzG1kez
 Sk+SIq67IsNOwS81LdmkRyqk4F0/6nztEtNEwvGH2jjgBa9svLOOx5KeBGSrHNo6SRW8wbaKMFd
 gpH/cPbM7BdA7K4CZVF4Nank=
X-Received: by 2002:a17:903:2acd:b0:2a1:10f7:9718 with SMTP id
 d9443c01a7336-2a870e18919mr20174385ad.30.1769521508991; 
 Tue, 27 Jan 2026 05:45:08 -0800 (PST)
X-Received: by 2002:a17:903:2acd:b0:2a1:10f7:9718 with SMTP id
 d9443c01a7336-2a870e18919mr20173925ad.30.1769521508384; 
 Tue, 27 Jan 2026 05:45:08 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a802f97a81sm116816095ad.47.2026.01.27.05.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 05:45:07 -0800 (PST)
Date: Tue, 27 Jan 2026 19:15:01 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aXjBXYLlFChzI7mb@oss.qualcomm.com>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
 <aXOvV-XRmn_Pe-ca@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXOvV-XRmn_Pe-ca@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDExMiBTYWx0ZWRfXyrALSr6SUOI7
 nNlhe2euhRhBeQp+Igs7DzuIqU9SLbIk2DJ1p/bd1ipFsduu3s0JWG/enoBGIYLslR0JnzsxyAA
 ZlvFYFckNNc6mGRputQxnXIQeLLKt5jTivJy/UNAQoX8Zfgj8GjREXU6u4iu8BDoGG8aZoB4rcy
 NZx2NdIHiCqH1o9fYsDg8OB1/KPSBqbPuVV6sPPL3nvkxpmx4zG35B/KrV0LfW/kOaNbWdyd2mr
 q0JzZcu7rnzR3yUWWJVYkWnjtqieoAl4BHAECObPx6JzpYTWcmWJY3DtkrdIDYBcCc5lS6aogo5
 ooE4mKhyzAKjvX/q1+XCH5rf719qOObziWyrybEE80v0LbS1+PatfGcdQFiXqQwRw0ZMMtzJ+/Y
 gQ515ifpnRRVmiYcXpVjeV6LiOugsNC3r/sZemRYR7cmQ+zAYx/3Y2Km96FRVEPwiwsuWbXEdXp
 z7HLM+tAnNEqONFY2gg==
X-Proofpoint-ORIG-GUID: 98xUT8zlbCQG0z08QyNOGHbydcGthM0R
X-Proofpoint-GUID: 98xUT8zlbCQG0z08QyNOGHbydcGthM0R
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=6978c165 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tlC0plkVVdZB6woX1b4A:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270112
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrew Lunn <andrew@lunn.ch>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS,
 BASE-X, and inband goodies
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
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,lunn.ch,linaro.org,vger.kernel.org,st-md-mailman.stormreply.com,google.com,kernel.org,gmail.com,lists.infradead.org,redhat.com,davemloft.net];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:konrad.dybcio@oss.qualcomm.com,m:andrew@lunn.ch,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:hkallweit1@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 5AC27950E8
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 05:26:47PM +0000, Russell King (Oracle) wrote:
> Sorry to hear that, but if it's any consolation, you're not alone. On
> new year's eve, I had three teeth extracted, including one that was
> laying horizontally in the palate of the mouth buried in bone, and
> needed in bone graft (modern bone grafts are quite different from what
> you'd expect btw.) It's been quite sore/painful as it heals.
> 

That sounds like a nightmare. I hope you get better soon.

> Given the results you've given, my suggestion would be that the
> following patches are probably the most risky:
> 
> Patch 2 "net: stmmac: qcom-ethqos: convert to set_clk_tx_rate() method"
> 
> This changes the way the clock is configured. It would be worth
> testing that and giving a tested-by for the first two patches if
> that's successful.

Right, this new sequence would move the clock rate setting to after the
custom core is configured. Unfortunately, I don't have a device with an
RGMII interface. I am checking if I can get my hands on one.

I have given a t-b for the first patch.

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
