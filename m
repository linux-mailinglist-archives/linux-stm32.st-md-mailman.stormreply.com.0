Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5ADC0C4EF
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 09:30:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9232BC60486;
	Mon, 27 Oct 2025 08:30:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0F46C3FACB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 20:23:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OI9LXM009678
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 24 Oct 2025 20:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4s7W/XVPsSKkxr5WrJxW2Xw4
 Bw8xDxZi15MzcSKlWvc=; b=MNXOWZkHxfew87KzdGBbhYPJYIi7C6XUeZFoaZfB
 Wesyte6wCdRC1+JJN861xNyBScJHCelVlCSQhdRlx7CUZ2Y4Yb2agVz2I9Rn/KQa
 thu1dlrRi85b1VFoEUZfccfyR16Nm9ZyWQENXwykriaKvRatun7GUtncm7IP2y3V
 L/N/O9GsCeuxB841wgvkHme+sFfH3g57Wn2RrO6X1RPzU6J1dfBx3QlQyvZ+sW9C
 ZGXHUG3r7NLpTeafH9LyRuNFV2/NrMlEHEJDdggNG5EJuaMvT+X+IJJ02zjEYXr/
 M3FSM2ZSBXfAFAcMdMZlH0R6KeheAKDcYWR/3Tl5DOOh2g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27jd3mj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 20:22:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b55283ff3fcso1602385a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 13:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761337378; x=1761942178;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4s7W/XVPsSKkxr5WrJxW2Xw4Bw8xDxZi15MzcSKlWvc=;
 b=r75IzqkKNJSoGp+sYWCXBWqKJpNNjM40KThPAIh8I9LHgSmGboNmC29YbLWTtejfm5
 ywtbhBGgfCkVxztVXRH2Q4QI5Gsqf1/sD4Mju0gj2QMYCOZajVvC3zhsJ42ro+xXVfBK
 Fcr30yh6d4ESSwLQLATOuqb93Pcp19u2VkqmmBqHcddjCBYbG/v5ohZ42ht1MmgIY39w
 XO6LM13uLerJwR0edYZTCvjne4lo+Oeiap24ayQnA8uC8WZUBbQSZTchZZ/5XUVk8BRb
 YILzZwCagDgplA+KeXyyqSK0UHDLQC1LPv/ljkZYWRFfLk/IQZk08TOmzqZo1UDevThV
 7xhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxDd9mml8ATyGoRwDzH5W+F/37HdOrFyaURxR/xO0cUrFCy68yEVHicruJ5ocun/BLw4bbNReTqsxrEA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzv1jTU8hDQ/xMcyEDXuC60d7vRPA9M3sIzMfOJQpZY+vIDCX0H
 HhTjp03bI9cYITfzxBeWOMoN0zuh+kidASR6sziH9utYcF4mqgRwyH8gE33dyb6hCR/UqbUNDSi
 pwC0ftIQegdHfsJm6pwIa6Wxebwcn1BKzRiFcbX9jlkH07CyRz29iKUDM/CdQoKvhk8q2F2yd9O
 9XjgDXGR8=
X-Gm-Gg: ASbGnctZ/RMCtQZdqGG3U14BpUZ4LhJ1hJX4l5WcDT3O4GG0SZ+rb/Bu8IjdxPlhxMz
 NfmYaPJ6EZVN0f3Cxdk0JX0WfvSLvGgrO5EB/daqi3i+rHpj7VLnHY08VozGo6AuBWULCm9mN9V
 leYlrhCUC/3SwWJf0Tt0AOc2CgInLaOWiPaildHKlgipIGYNAQ/5CDjW2mWLIzy9l4QcJelhTIW
 PkHpWIRmGXugAq+Vt7IephDpQ01PiPWQeuW7ztyNJz0SDYotlmoa5Amd2inTt2ylh+ZRzwxubN7
 S1E5fwp6sDKKMQRkMIuWm+znR9HxwCqC0Ns37rRJ2MF+6is4eAOqb804QWT+hltwtBz7AZtWTBa
 luINS2H6OK9dQ
X-Received: by 2002:a17:903:1250:b0:290:dd1f:3d60 with SMTP id
 d9443c01a7336-290dd1f3fc8mr257610725ad.51.1761337377906; 
 Fri, 24 Oct 2025 13:22:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbuyFiJ9PskI3CsAgB4hGF6Xk8h6QS2PPp/bDpzFnWGnwg7UfgJO6gCcviCKkunL4F1CUUrw==
X-Received: by 2002:a17:903:1250:b0:290:dd1f:3d60 with SMTP id
 d9443c01a7336-290dd1f3fc8mr257610465ad.51.1761337377287; 
 Fri, 24 Oct 2025 13:22:57 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d23218sm897285ad.51.2025.10.24.13.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 13:22:56 -0700 (PDT)
Date: Sat, 25 Oct 2025 01:52:50 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aPvgGjHr3eR0088m@oss.qualcomm.com>
References: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX47KVJaxMdHVK
 YP3WpfNLZgKQpB67lDoDKvx0+srcYXa1+UTD/mBpvdcB+9S8JwBNjKqUugk3pA7/TIyXPxBxe6w
 gPuF80Yu7nwkG9lP5alG/ajS51nmUUMMLdTuWUw7nMMGOgckJ4iJD37XnrbkuqJ+55KC22eYI3n
 qitYXsXXRFKDd1mdgS2GxKZStDDlU7S+41Un5BGitMJKGEGe75V6AqIL9UwwBqES0hgaGBWsezY
 64C/ld2gtvPSTxlOHe1ji/zJDpXkHqoDzVTAWIKlX1lrp7rdIN2vuCmlhOkqZYJQG1jPzJvYsLu
 XLWT8IGtkwBvPEyM/srQ+/bUcEQ/A3f+7hiOOYACTfQfh0YfCDSCZamyAgA9k+Q2XUn/zUcVTxm
 9VUoWUchkSGFYx/1Ki6PhArxz+6TiQ==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fbe023 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=t3lSQCkMIvt0bwidl4oA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: wiu-Qq_-aNutGe0NS-U5tAa7-V5vYIMy
X-Proofpoint-ORIG-GUID: wiu-Qq_-aNutGe0NS-U5tAa7-V5vYIMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
X-Mailman-Approved-At: Mon, 27 Oct 2025 08:30:00 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/8] net: stmmac: hwif.c cleanups
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

On Fri, Oct 24, 2025 at 01:48:23PM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> This series cleans up hwif.c:
> 
> - move the reading of the version information out of stmmac_hwif_init()
>   into its own function, stmmac_get_version(), storing the result in a
>   new struct.
> 
> - simplify stmmac_get_version().
> 
> - read the version register once, passing it to stmmac_get_id() and
>   stmmac_get_dev_id().
> 
> - move stmmac_get_id() and stmmac_get_dev_id() into
>   stmmac_get_version()
> 
> - define version register fields and use FIELD_GET() to decode
> 
> - start tackling the big loop in stmmac_hwif_init() - provide a
>   function, stmmac_hwif_find(), which looks up the hwif entry, thus
>   making a much smaller loop, which improves readability of this code.
> 
> - change the use of '^' to '!=' when comparing the dev_id, which is
>   what is really meant here.
> 
> - reorganise the test after calling stmmac_hwif_init() so that we
>   handle the error case in the indented code, and the success case
>   with no indent, which is the classical arrangement.
> 
> ---
> v2:
> - fix "verison" typo, impacting patches 2, 3, and 4.
> - added reviewed-by / tested-bys
> 
>  drivers/net/ethernet/stmicro/stmmac/common.h |   3 +
>  drivers/net/ethernet/stmicro/stmmac/hwif.c   | 166 +++++++++++++++------------
>  2 files changed, 98 insertions(+), 71 deletions(-)
>  

Tested v2 on Qualcomm's QCS9100 Ride R3 board (qcom-ethqos driver,
GMAC4), so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
