Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C27C73E06
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Nov 2025 13:07:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BFFFC01FB4;
	Thu, 20 Nov 2025 12:07:42 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B5BBC3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Nov 2025 12:07:39 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AK9hIY5473250
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 20 Nov 2025 12:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rocURVTpRm6dtP5iHBbr10ILRzx3pCec9r06uq4Mrmw=; b=bSNFcJjzfM2eSZVf
 ap7LPSWqzx0iOfNw2FHgJl2e1XDcCHL5jQ095fGr6BUpn4yQtsw74Zz1t/eJrkUg
 rxm35bhzhwyulCh2F3rGzLU5Sp0dV1nNgh3fC2bBs8miPZZtHjAN5BE3i1QmfJhJ
 6TOD02J2KMYAqobOhBxlDtJSUa9xTflsIAUoVqNA2WOOzqWpWGf2EJY9nSCBEuRD
 8c6AD/Mw2K7VSe3zGHvexXf7smHw6Mn7KqfcSJekKr3LHFbMVuD3xi8SMhRG1A3C
 v4YSkkoXSjAXHqc2JAo2Xp3j++EYALsSDHZAWnJkfkbPpKSsYDRfqItZvw3/MhjJ
 5c+f/Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aj0kw0d7m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Nov 2025 12:07:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee24e1559aso2402881cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Nov 2025 04:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763640458; x=1764245258;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rocURVTpRm6dtP5iHBbr10ILRzx3pCec9r06uq4Mrmw=;
 b=AmvZWrwdpoMPUfTKPnrH2tZAdyPPsJRMlIFU9ohZ07VF55eu7xpq4H92/nAZs1cc9F
 cIi61onxZ/LY4RVqeb5ZZnt2Nd3uKFHS3rR5fMFUbphzoNshY73ezkSGpWW7JP94L0Ja
 9GDGhRlq6xCeSi9r52RiiNJwJZ4Evwo1qjGg8SUuSCoSYTHekvGXIKHJlr2tTDbaJIDM
 ECnJUmB9TVYp+N5jnSwcr6hudPI7Rp9k17PkxU0+ONKhxE029Jy4yrZniPQ/wkPYgEnQ
 QqYO/8xO7AgH1Ctgv8Lkd1mb1mGf6r2ugD6pjkbPnh2X9TXnNXA7iRVvirtW2kb90QhL
 lUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763640458; x=1764245258;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rocURVTpRm6dtP5iHBbr10ILRzx3pCec9r06uq4Mrmw=;
 b=Uc6WjhY121W2+0Y1y4KWSQc7zxoTyKxhqh07y5PtuZQdKiyI6gqT0aQ/aCxqkMuCUy
 lWBbPX9cNtwR+QnfTwd+i8QEDLFkmr3GTlaphUGptwcTTkUiI5zZ11SGexswyET/EW4B
 MT83q5QCYN6FlJ1gngDWRC8IodkSdIKdCFWnvhcipqGJXeWArrOgc4AIQFAmY8g8VZJ9
 25cxaZaHqsEVqau7e133AVVcx1vOfpIR05zc7wZ0ymQMVMzrTnwz2pvabSiAHyS4g6vS
 b9gr7IrdbQF2X8Ob4P7woV8sCJcaf+CLq6Wnr1O1JhqzSP+ADVn58VrsQGj9G5+ohEi6
 o+SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOXP5Vv2TLt1F38nxZFW2L2q2XeL1Py3Kbb/Cj86IYPhsTDc86z6+sq/vgGiMwTVmLzHetxRMafMQFcg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzmHASKXvU5jHet04pGBwHSvTwfUk9i4nEkf9wsmJGI3nCJDpK0
 3vP1Rwinr3R4TuoHm1zu/EZ/taDCjBd7KBZRuPwiOCEZ5U/HIzMD1aHJSOYeHg/HGb4jUOiM7jE
 C+ihBrUIUDw2H1GMKeWZHYivSlWtgSf66f4fFeeuRvLEOu6nWCIlAy99WlzbhRYuRYSjhEqZtDs
 sVZOpfrBY=
X-Gm-Gg: ASbGncsZdm08X9gwQUGxNhV4lc2FqZK9fgVsgRA1JlwmhEbWyvs59L8Ob4SZPg7jGXs
 Gcr2TKUl+r2dt9se9jl6zsJpmLNiPrXKc/6BDt6GNjD2Utv+z60KytqoSctHk1P6FkxVakAUdLr
 rP6v+O8STu1irHO9JXpsVs1fUq56NKcfSeRnVyEhwdtq/2FlAxnwSZwpXS4LAlxT0IyU168KB/N
 X6LUqXDOsOE6W4A1wuqOJ3QpBcUUZ07L2yFzAXzq3MoSx+Uswcchp4yh3YvRQbeoCIcsrvyPhar
 QEfO3xbjw6DpmXO8vaCSzh80MRjVx9X5LiMtCieFievleU2HILm/GmBPOVvOMPJqdpBJk1gYmk0
 A+f5o10li3UCYGrsFSSs25TTzUDY3hP/wDc3KcEM+S5Aeby90d9qmTPo8wJJI9TfnAYg=
X-Received: by 2002:ac8:7f49:0:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-4ee4979d58amr22346591cf.11.1763640457824; 
 Thu, 20 Nov 2025 04:07:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7C0G7oIjRGR0HYITo/8aJIWfL6aczcG7wVEVYDZP+JyR4xosC6Jsi56JuaGBd1eQMFrosxw==
X-Received: by 2002:ac8:7f49:0:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-4ee4979d58amr22346301cf.11.1763640457383; 
 Thu, 20 Nov 2025 04:07:37 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cdac18sm189684666b.11.2025.11.20.04.07.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 04:07:36 -0800 (PST)
Message-ID: <02b73243-f7a0-404d-913a-f95c0ce80632@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 13:07:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aR76i0HjXitfl7xk@shell.armlinux.org.uk>
 <E1vM2mw-0000000FRTo-0End@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <E1vM2mw-0000000FRTo-0End@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=WeUBqkhX c=1 sm=1 tr=0 ts=691f048a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8
 a=-t6nT1al7WGe8XWH3MkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: oEhlhXDiFv3RvX93SNaAt-ymL2xics8E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA3NiBTYWx0ZWRfX/FkCHaQUCegF
 OovHjT3ro/tuMLoBhMzZZTIfaG0vUJk3ha1pp5RuIN27myC0vzqm33jTCJuId98RQZDt2YkiMCV
 DwxrqHFD7hByNeY8aLUySR3uUg3W9d34salruqmUS/W35Le+Wtk8tNOmPche3L+G2MPIBbWYynB
 2KY0EarAGeQrNGBKITicxLkK7qcKuVUFo0Sa/8W9g+Re1TTMroADhQ0jhrQOflb6g+medl89+8t
 4jXseeF6C1ADyoe9ANawMIRXaLUgisbidYU5vdRoQiCiqxLlzuTtqk4ngt0IdybjIkuaQ1ZPbTC
 2AW3/FdCsjYLFx1XwXX3Lcd1fOMn/N3gxd6TOFaH86vQBISPxzbSpkNQR3WE11e10UP9M6Ac35s
 y4zVsXeB6ZB9FvSoo7xjgCeDiWWo5Q==
X-Proofpoint-ORIG-GUID: oEhlhXDiFv3RvX93SNaAt-ymL2xics8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_04,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200076
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/3] net: stmmac: qcom-ethqos:
 add rgmii set/clear functions
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

On 11/20/25 12:25 PM, Russell King (Oracle) wrote:
> The driver has a lot of bit manipulation of the RGMII registers. Add
> a pair of helpers to set bits and clear bits, converting the various
> calls to rgmii_updatel() as appropriate.
> 
> Most of the change was done via this sed script:
> 
> /rgmii_updatel/ {
> 	N
> 	/,$/N
> 	/mask, / ! {
> 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)\2,\s+|rgmii_setmask(\1|
> 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)0,\s+|rgmii_clrmask(\1|
> 		s|^\s+$||
> 	}
> }
> 
> and then formatting tweaked where necessary.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
