Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPZ2EcW4lGlmHQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:51:49 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC62E14F5C1
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:51:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88DC6C5A4C5;
	Tue, 17 Feb 2026 18:51:48 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5181AC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:51:46 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61HFUC682319801
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 17 Feb 2026 18:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gpHs+q5sc2ESyRXoe6yeXOmM
 BULgitSi7HAS3517law=; b=IpcZoKPlwXP+qSoGmhgA7aZ52B1WDxH60u2yqNm+
 a5XxCGsJPgPhfqBPTXWf7qOlgQuVwrPxC4KfNYzmebtTVsM0jTq0mvnvTl3y/f/l
 6v2h3wLnFDfuhLBvv9e9l1v5GYpyBLRSussMg7oMIV6Du0nO1tQ472vJygiK67R5
 P0kLbqvSLaQcGAaOkSexpBhyRexouLT8bBsqxmA+q/aCA30GQZ+4pBiBIuTqjQk1
 EznJTER67p2oqpav6zrzwHrh3M0d0iT78Ytmoy/JhqgeRF3QtswLNt1i4k63rG2N
 Lhi3X6WzeE+BEFGXcEhHliUAmSdscI4qSswmFpqCrBBvlQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccu1ernx2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:51:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3569ceeb335so4663428a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 10:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771354304; x=1771959104;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gpHs+q5sc2ESyRXoe6yeXOmMBULgitSi7HAS3517law=;
 b=aOveXx5dWTsdgT6EcJEqRKaD5p0rbBSme8PxYvarn2iV2Bt//01/+7h7VHN48hw0E5
 sQaKvQi/1XUQuDEwi1mDoNy9vexMx5oquP/kthqrkXitgOGS+fIZiS/bNeZtTZtk9aZL
 p+WtoeKGBt2M5ntkeJvOcGO3gwXlWIDG/48cCznn8VLVIoNOckbl7pqCYx29DAd9zRya
 IAt0XPfKL8mvIdUVdOGJa7LqLJjuYxITDZ/ijlZnh1O6X+cYTNgWb4+fJtLdt6ytaV/1
 Z5EFq2PP7cgSI8Br1Egdv+24AYJU5bvTZwmph+nq7+GbU/1XRV9Fi4l/ZHcdIhFTwDhH
 QEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771354304; x=1771959104;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gpHs+q5sc2ESyRXoe6yeXOmMBULgitSi7HAS3517law=;
 b=jN4Nqra8741aWqPuDgGX1sKTgHApu++j0vSX4ilMqLjNzFz1qwhFBEJ7i5R2zqU1lA
 Yias28rGQLAkjjSbUYF0iHqaUeSERd33BETH5XxJuNQ0uM2aagv+Tq6eutyfrKqjWvCQ
 aFdknO2P+FfA81Is9DX4/riUygyCEnDDeG/0OJfII0YenEDQKInqBqk3QsuzRoxYhB42
 ftBsFpirXUOFP8lX5NLF22yK1oKRN4PdktJFBYfXJJ9JTbTEw1raavYmne08W6wStXnQ
 MLHWadRKLFkST/R4ugo7KENDjqOzbDh3k0bHE0o9eIs5fzZk93i5Tipb0QlClvfjlrxA
 cD3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfsDtWq91N5q1+A0Dayf6LKTkz+upCvTk1+3CL4DQwoaE8rnosP2fcQlCcYJPennLfcofwMXrwdGiFLA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwMXlK5weLQr7gVggTJcynRDIrh1bx6n2xJrA4GgfzjT7UZ5x5f
 vyKKtCwLAssa8AxEHROY+vDVwFsEmTOJvFWjSfUHYd4TWDEWT6FQfgKTArSd6GuWrGx2ZYULYbX
 2Hkd2K9k707x0QxVkFk0A8NIi1tvQ7qRzswdETsCGHHLiVWcMk4uZ0SXEtEInQq0WkZWPugcIfB
 oKvWuhjxA=
X-Gm-Gg: AZuq6aJMOIJvWgVgHfKF9Ex7icBeTWTobzTLSA4LBz/f5nfILQPBHsyKbJWYfW/kuB+
 FrTR/KwLcpAir6Z6Tm7M71cRsZWejR8ytCAUuvYisbW8krQXXxRDR9mLIiHZJH6qixO0b7/CJnr
 D8JNChOVQogCDUZaH5AA3fbutxQVc1ML9yxRpcEoAkEJ/oKaNZYnIcoKrqtJOd6U/9NTTolIUTu
 hT55fpOZIjeoTuQd6PoFxCXTQ5Eno8MUts+inxFzWa57h0CVahb+vwBnZ1atB/FsoE5bmFlII5I
 RwpeEZkyRN6ejucEH2nC5AG8GSOtdI3j0IDNXXXuIRnCorSo1yabl14fdcxRkTHjtcfIPjM9L3e
 cF9A60H5YDgcbHeYSApWZhab1NLcNJD2mJqY=
X-Received: by 2002:a17:90a:e70d:b0:330:7ff5:2c58 with SMTP id
 98e67ed59e1d1-356aaa98b25mr12221095a91.7.1771354303840; 
 Tue, 17 Feb 2026 10:51:43 -0800 (PST)
X-Received: by 2002:a17:90a:e70d:b0:330:7ff5:2c58 with SMTP id
 98e67ed59e1d1-356aaa98b25mr12221081a91.7.1771354303326; 
 Tue, 17 Feb 2026 10:51:43 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3567ebc4331sm19801025a91.16.2026.02.17.10.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 10:51:42 -0800 (PST)
Date: Wed, 18 Feb 2026 00:21:35 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aZS4t5Uf21PTOQA7@oss.qualcomm.com>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <E1vjDr6-00000005fQ9-3RUD@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vjDr6-00000005fQ9-3RUD@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=LfsxKzfi c=1 sm=1 tr=0 ts=6994b8c0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PHq6YzTAAAAA:8 a=UutzXAvyMBxkWM3TwEQA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: lH1NqKhaVNHpPf57nNdbN8YQJoLz6v4a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1NCBTYWx0ZWRfXy2lFYPHHP3GK
 ZNGdBa6oG/DbQ/JNx+OOBurAiBC6lt/fssN/Y3PTBnvFz1F3TDjAMG/Umzu0PlOC0cr2FMA6uH3
 WVt2InN9j9mSnbXLOgg9lKP0vNq83SZLLqJ8qvYkanEAtb67IhNszRs3mDhJ5HD9tzoAVbtIs19
 LsQpRd+ShjL5281DZsJy51z12GAuJ4wQmN51Lncivg7aQPrm5xX6e1S8kcz+BGSossCRtAYKr/V
 N1yRbkPUcqffv5jRVrCL/adCLZUbu5IUTwOV7loe185LZBFsXDOggM1rRibmTXfZK3B/NSmgWRX
 RWyQSNKaLTZnVdCsEojEPY5SBFf8d9qOHMzcjMoRZrPFihHh3Vt5QC3E6HhpQ20izKGpRzlGhzA
 korNZ8b71kjMY+jnEx6cnsBdzn0TINDElzmaq8I9YTD21kRyBAX9gns7bRZkFdJfoYLueBKv2Ly
 CPvuErw63TpchR35KhQ==
X-Proofpoint-ORIG-GUID: lH1NqKhaVNHpPf57nNdbN8YQJoLz6v4a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170154
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 02/14] net: stmmac:
 qcom-ethqos: convert to set_clk_tx_rate() method
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
	FREEMAIL_CC(0.00)[lunn.ch,redhat.com,linaro.org,vger.kernel.org,st-md-mailman.stormreply.com,google.com,kernel.org,gmail.com,lists.infradead.org,davemloft.net];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:pabeni@redhat.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:hkallweit1@gmail.com,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,armlinux.org.uk:email,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: DC62E14F5C1
X-Rspamd-Action: no action

Hello Russell,

On Fri, Jan 23, 2026 at 09:53:28AM +0000, Russell King (Oracle) wrote:
> Set the RGMII link clock using the set_clk_tx_rate() method rather than
> coding it into the .fix_mac_speed() method. This simplifies ethqos's
> ethqos_fix_mac_speed().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

No issues found when I tested this patch along with "net: stmmac:
qcom-ethqos: cleanups and re-organise SerDes handling" on the QCS615
Ride board with the KSZ9031 RGMII PHY (see [0][1]).

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
---
[0] https://lore.kernel.org/netdev/20250819-qcs615_eth-v4-6-5050ed3402cb@oss.qualcomm.com/t/#ma85cac924488d580b971e6477e7df30dc7e48045
[1] Ethernet is not yet enabled for this board in the upstream kernel.
    The changes from [0] were applied locally to test this series. I am
    trying to figure out how the board deals with RGMII delays so that I
    can revive the series.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
