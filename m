Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F2EA54460
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 09:14:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17764C78002;
	Thu,  6 Mar 2025 08:14:09 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1844CC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 08:14:07 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250306081404epoutp03e9467684d49a73017f6bae0a95518497~qKJkdBVjk2553325533epoutp03b
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 08:14:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250306081404epoutp03e9467684d49a73017f6bae0a95518497~qKJkdBVjk2553325533epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1741248844;
 bh=KECuehhvu0FH3iTK1TaavUX6adMlIsZ1ueFUr/zvens=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=h+bG3DNluo93Sxva40Zkvug64EFuFBRp/Mr4o3Jd4rQ4S+G8b2PrwKYYWLf2D2Ec4
 BvIi74ocgo/lXWjvwFOVfijXlR2/BTpMyMfNxHiGrlD3P+H1fgdQdKfrytMYHpNMO9
 FLNUB4ftT9AwnfHpOCYCSxhI8+3YO4D9GxpA5sAU=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20250306081403epcas5p4bd3f9c079f1ca24762c19728e468c6d5~qKJjwUkQi2477724777epcas5p4R;
 Thu,  6 Mar 2025 08:14:03 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.182]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Z7hyc6Jcgz4x9Px; Thu,  6 Mar
 2025 08:14:00 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 12.51.20052.84959C76; Thu,  6 Mar 2025 17:14:00 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20250306074556epcas5p1f4f9128afb3d2d912d3679dde2a4ae21~qJxBHOgwj2664726647epcas5p1K;
 Thu,  6 Mar 2025 07:45:56 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250306074556epsmtrp1301b03234c11231d681ef785ab7d7ad2~qJxBGEdEd3125731257epsmtrp1F;
 Thu,  6 Mar 2025 07:45:56 +0000 (GMT)
X-AuditID: b6c32a49-3fffd70000004e54-c2-67c95948db40
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 4A.51.18949.4B259C76; Thu,  6 Mar 2025 16:45:56 +0900 (KST)
Received: from FDSFTE596 (unknown [107.122.82.131]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20250306074553epsmtip2fcf11e3f790316369b21a1e5eb8c2f52~qJw_JvO7Q2300823008epsmtip2M;
 Thu,  6 Mar 2025 07:45:53 +0000 (GMT)
From: "Swathi K S" <swathi.ks@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <krzk+dt@kernel.org>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
 <conor+dt@kernel.org>, <richardcochran@gmail.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
In-Reply-To: <041d55fd-99f0-4b55-92e5-fa46f37096c1@kernel.org>
Date: Thu, 6 Mar 2025 13:15:45 +0530
Message-ID: <012801db8e6b$cb835bb0$628a1310$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQMyDtpN5Ye5e5YD1uDKr3q9BdsruAHcwqSBAgrqhY6wmXxL0A==
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0xTZxj2O+f0nLZadixMPpqo7LgQIQNaLfVAABdFc3QXcQubbj9KQ09a
 Qmm7XvCyLNPodOu4DBNcbCoysgEiyB1abjLGIDhWRCiRLYAb4IBhRJ3lYpBRDm78e773e973
 eZ7vy8tHxRcJCT9Vb2FNepWOwoVY/U+hO8OZ490a6ReXZPTC1GVAF9938uiyFjdCO3rPY/S1
 DjePnuj8k6CH2lwIPWUfwene3kqCvlOfzaOrxwZ5dH+jA6dtg+M8On+pnEd3Fmyhvb/MALqw
 7h+C/mO2maA7eiZR+m5OLkIvNzsJ+lv3GO/NLUz/YB/K1F4fQpiJnDqCcdmHCaag2spUl36F
 M50DX+JMzfefMy7nU4R51OrBmezaUsD82CpjnlZvSxR9lBarZVVq1hTM6lMM6lS9Jo56633l
 fmWUQioLl0XTe6hgvSqdjaMS3k4MP5iqW0lNBWeodNaVUqLKbKYi42NNBquFDdYazJY4ijWq
 dUa5McKsSjdb9ZoIPWuJkUmlu6JWiMlp2tahMdxY5XeyruvUGWDbZAMCPiTlsN9+FbEBIV9M
 NgH4rHYE5Q5PAMyZLkJ8LDHpBXAgK/Blx+NMF8HVWwCc9BzlGiYB7OrIQ30XOBkGC7NbV0kB
 ZAsCH5xN9GGUbEagbVHmwwIyHi433lnl+JMHoed6D24DfD5Gvg5HnKtaIjIaTvY9BhzeDLuv
 jGPcmO2w4aED5fwEw4WJIh5XD4Q/L2SinOw+eG/eg/m8QbJJAOf6+hCuIQHOXS7COewPp7tq
 CQ5L4FTOhTWshDeyPRiHtXB4MXeNvxe2DTgwn0+UDIUVjZFceSvMu30T4Tz4wazn42tSIujM
 f4l3wKW/B9dGBsH6Hx4R3wDKvi6afV00+7o49v/VCgBWCoJYozldw5qjjDI9e+K/304xpFeD
 1Y0IO+QEw/dnI9oBwgftAPJRKkDU9263RixSq06dZk0GpcmqY83tIGrluXNRyasphpWV0luU
 Mnm0VK5QKOTRuxUyKlB0znVeIyY1KgubxrJG1vSyD+ELJGeQq8qEm08c88ujLzDtbYlGoQX2
 JOvMph3e03suhP9W4u+uvPGJKXlj4CsDwjFYZdwQdqjsg9GkisOx3md+Z0VbR8u3ZQgYxdyH
 ez/2u9sUK1gOL294bZ+QHP0rCSvpVWaPTF+xH9ssK8KPnBQJS5rFOSGGB5OpFfMAqB+WxOw8
 kGj0Kyv0D5HzZg1pv4cUJ6Qc+HT7sY06NlKIq3vieSZtWPdSxpH9AyHjzVWdU4MbMnc7kMZk
 qZu4JsoK8D938Q3d8Xz583n7SF4DP+idEzOLn7nhuNZrLvDcijr8XqjE+92vSOjR1MoXu75u
 u3VPhS835lvyrTUxWK+hpjjDVZdLYWatShaGmsyqfwEg8MdImgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIIsWRmVeSWpSXmKPExsWy7bCSvO6WoJPpBvPmq1r8fDmN0WL5gx2s
 Fmv2nmOymHO+hcVi/pFzrBZPjz1it7h5YCeTxctZ99gszp/fwG5xYVsfq8Wmx9dYLS7vmsNm
 0XXtCavFvL9rWS2OLRCz+Hb6DaPFoq1f2C0eftjDbnHkzAtmi0v9E5ks/u/ZwW4x/dxjVgcx
 j8vXLjJ7bFl5k8njaf9Wdo+ds+6yeyzYVOqxaVUnm8exKx1sHpuX1Hvs3PGZyeP9vqtsHn1b
 VjF6HNxn6PF5k1wAbxSXTUpqTmZZapG+XQJXxr6bj9kKNvJVbD1e2cDYxdPFyMkhIWAi8bFn
 JzuILSSwm1Hi9ilbiLikxKfmqawQtrDEyn/PgWq4gGqeMUpc236GGSTBJqAlsahvH1hCROA0
 k8SP9n9gk5gFjjFJ7DvPCdGxn1Hi3aeNTCAJTgE7if+7LoAVCQu4SVxdeYati5GDg0VAReLe
 DnGQMK+ApcSLix8ZIWxBiZMzn7BAzNSW6H3Yyghhy0tsfzuHGeI6BYmfT5exQsTFJY7+7AGL
 iwg4Sdz4cZVlAqPwLCSjZiEZNQvJqFlI2hcwsqxilEwtKM5Nzy02LDDKSy3XK07MLS7NS9dL
 zs/dxAhOFVpaOxj3rPqgd4iRiYPxEKMEB7OSCO9Fv5PpQrwpiZVVqUX58UWlOanFhxilOViU
 xHm/ve5NERJITyxJzU5NLUgtgskycXBKNTBVWAp3GQcffyCWIxyxc8ext5ISD2xz5e8tyoj7
 fW7C686G2TdLH2+2mvaOSZY5uFc4srFm80Ir35m/q+xmZi/h0hV946HdeS/Yt3zCbJXAnruL
 5M4+7JlZ3lyya297pcrdFd8bu1b+EUsrnscyi5fJkbvL/3XwnCPym25duMSzVVnptuJf/gkx
 F9dIbHuxsHJq1+5rX+pYEjKz3qf2fjZ9nOL4cgnb1r0zih95r9Ta+LJY209FxXl9vsSBFd92
 6j+yPn6oYfFdvqun/H9q2XDWn9C+qvNs74cPlx9wVPDu2P1GQ9H9YOkKg7xM8doTi5WCThVt
 mfm6+VvXUg0NDhPfMishKf7616JzFjs2vIhVYinOSDTUYi4qTgQAfyO6KoQDAAA=
X-CMS-MailID: 20250306074556epcas5p1f4f9128afb3d2d912d3679dde2a4ae21
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250305091845epcas5p1689eda3ba03572377997897271636cfd
References: <CGME20250305091845epcas5p1689eda3ba03572377997897271636cfd@epcas5p1.samsung.com>
 <20250305091246.106626-1-swathi.ks@samsung.com>
 <041d55fd-99f0-4b55-92e5-fa46f37096c1@kernel.org>
Cc: devicetree@vger.kernel.org, ravi.patel@samsung.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk,
 tools@linux.kernel.org, pankaj.dubey@samsung.com, gost.dev@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v8 0/2] net: stmmac: dwc-qos: Add FSD EQoS
	support
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



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 06 March 2025 12:40
> To: Swathi K S <swathi.ks@samsung.com>; krzk+dt@kernel.org;
> andrew+netdev@lunn.ch; davem@davemloft.net; edumazet@google.com;
> kuba@kernel.org; pabeni@redhat.com; robh@kernel.org;
> conor+dt@kernel.org; richardcochran@gmail.com;
> mcoquelin.stm32@gmail.com; alexandre.torgue@foss.st.com
> Cc: rmk+kernel@armlinux.org.uk; netdev@vger.kernel.org;
> devicetree@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> pankaj.dubey@samsung.com; ravi.patel@samsung.com;
> gost.dev@samsung.com; tools@linux.kernel.org
> Subject: Re: [PATCH v8 0/2] net: stmmac: dwc-qos: Add FSD EQoS support
> 
> On 05/03/2025 10:12, Swathi K S wrote:
> > FSD platform has two instances of EQoS IP, one is in FSYS0 block and
> > another one is in PERIC block. This patch series add required DT
> > binding and platform driver specific changes for the same.
> >
> > Changes since v1:
> > 1. Updated dwc_eqos_setup_rxclock() function as per the review
> > comments given by Andrew.
> >
> Please stop referencing some other threads in your email headers via
> "References". This is neither necessary nor helping our tools. I can never
> compare your patches because this makes b4 busy 100%:

Will take care in future

- Swathi

> 
> b4 diff -C '<20250305091246.106626-2-swathi.ks@samsung.com>'
> Grabbing thread from
> lore.kernel.org/all/20250305091246.106626-2-
> swathi.ks@samsung.com/t.mbox.gz
> Checking for older revisions
>   Added from v7: 3 patches
> ---
> Analyzing 86 messages in the thread
> Preparing fake-am for v7: dt-bindings: net: Add FSD EQoS device tree
> bindings <never ends, 100% CPU>
> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
