Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54629A5445D
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 09:14:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08B92C78002;
	Thu,  6 Mar 2025 08:14:04 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDB58C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 08:14:02 +0000 (UTC)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20250306081359epoutp021ffe70924334fc1e913161eaea9f0d70~qKJgM1wam2640826408epoutp02x
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 08:13:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20250306081359epoutp021ffe70924334fc1e913161eaea9f0d70~qKJgM1wam2640826408epoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1741248839;
 bh=GFNB3GQfHuZhgoLh28ySpFkcndevRW3IQZO7WqPJuLc=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=TRRYU3YQJPsGxLk2/M/mc9QNMWkBFVrclJD3t50D40EOYKrvT8TDLWlMOay0wXKA+
 Cvn5BD+p9d/jW2OA35+xZx/jx9gzRV3uTqqcOy9l8Z9sarGrw6cZc2wn/Hp/BoKEdE
 5v69T4r3M1hrNZNFg4nGR8JhCcKWe4n3pA6twuPg=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20250306081358epcas5p45839d254f72b81c22b1854bf49ddf2bd~qKJfudMFH3180531805epcas5p4j;
 Thu,  6 Mar 2025 08:13:58 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.179]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Z7hyY07Xjz4x9Q7; Thu,  6 Mar
 2025 08:13:57 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 0A.75.19710.44959C76; Thu,  6 Mar 2025 17:13:56 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20250306074425epcas5p20a08ef2dbd5705a1044fafb8c4a9ec15~qJvr5Zkdd1625216252epcas5p22;
 Thu,  6 Mar 2025 07:44:25 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250306074425epsmtrp13d2eb93faea97f50364276552d52caec~qJvr4VzDQ3019030190epsmtrp1-;
 Thu,  6 Mar 2025 07:44:25 +0000 (GMT)
X-AuditID: b6c32a44-36bdd70000004cfe-fa-67c959443956
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 41.8E.18729.95259C76; Thu,  6 Mar 2025 16:44:25 +0900 (KST)
Received: from FDSFTE596 (unknown [107.122.82.131]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20250306074422epsmtip18b4df393bbcbb9f3899d26f119ba0546~qJvpHt7NI2008120081epsmtip1a;
 Thu,  6 Mar 2025 07:44:22 +0000 (GMT)
From: "Swathi K S" <swathi.ks@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <krzk+dt@kernel.org>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
 <conor+dt@kernel.org>, <richardcochran@gmail.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
In-Reply-To: <789ecb2f-dddc-491b-b9f8-5fb89058fd1b@kernel.org>
Date: Thu, 6 Mar 2025 13:14:13 +0530
Message-ID: <012701db8e6b$950550c0$bf0ff240$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQHcwqSBZNYxUrKMqce/4F1P5N/GfgGyT6S5AetEnA8CiHKSMrMyHirw
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf1CTdRzH/T7bs2eQs0cE+cIdtKZk4oFbbOuBE5AkeiJJUq+7uro54Gns
 gG23jQg9L6ydCelwpl48oBArLYSIMWAT+REhNuRARBZw4oGAB04Owp1FKbXxQPHf6/v+vj/f
 z+f9/d6Xy/IrwIK5SpWe0qrk2QKOL7vxl+0vRyS+51AIz3ZKiMWZ84C4PGZDieqWXoQo6zOw
 ifLOXpSY6rqPEcPtdoSYoe9xiL6+nzDiVqMRJSwTTpQYuFrGIYqckyhx8VkNSnRVbCae3HwE
 iMoGN0aMz1/DiM6eaRZxu9iEEP9cs2G7A8gBZz+LtP4wjJBTxQ0YaadHMbLCkktaqgo5ZP23
 n5J222OEnGsd5JBGaxUgf24VkY8toanr38/alUnJMygtn1KlqzOUKkWs4K0Dsj0yiVQoihBF
 E68K+Cp5DhUrSNybGpGkzPZkFfA/lmfneqRUuU4n2Bm3S6vO1VP8TLVOHyugNBnZGrEmUifP
 0eWqFJEqSh8jEgpfkXiMh7IyF2+eA5pZ/JOm3yvRAnBqQxHw4UJcDB+Y/8CKgC/XD28G0Oly
 c5jFAoDdfzahzOIJgE/dNGe1pMjQvOJqAbD2af2KaxrAOkf7souDh8NKYyvmZX+8BYEPjqV6
 TSy8AoF1N8yId8MHj4MlxvPLvAl/B5Z13QVeZuNbofWrJraXeXg0vNM1jDK8ETpKJpd1Fr4D
 XvrGxWJG4sPFqUsoowfC64snPTrX0zgJTvSkeftC/LIPPOamUa8O8UT45UAUU7oJPrxhxRgO
 hjPFx1dYBq8YB9kMZ8LRv0wr6eNh+50ytvcYFr4d1l7dycgh8Fz3jwgzwQZ46u9JhNF50HZx
 lbfAZy7nypFBsPG7Oew0ENBrgtFrgtFrwtD/d6sA7CoQRGl0OQoqXaIRqai8/x48XZ1jActf
 ITzRBobKlyI7AMIFHQByWQJ/Xv/bDoUfL0Oef5jSqmXa3GxK1wEknts2sYID0tWev6TSy0Ti
 aKFYKpWKo6OkIkEg73O7QeGHK+R6KouiNJR2tQ7h+gQXICnJUXD8tnR+JN+fL90ygiydeS2O
 jhweS3jRlsi6sOCwTtVmWGOyjrr6267Ub3gj4GCb9jNh7Im8NoO9KbU5eDCiq/T5+UZrWK95
 Nr/v3f3K5+C8pRtoHoXVG6uFmPU6ht27NTA7ZXSOhP42ML3kyz9dfkb5kXTY5l6Ijy81xplF
 +WGLyTGmaWRo/cbAWV153lKoa3/Cm3OlLsmOD8a3YuLol3qG8l6XrQsK4R13m/d9P56C7TGf
 TJLtXafcd//h16FHqg0hh2t3d/psq+ksjD9R8mGaoeHIoRo/+tcDKWkJphatZcw0ykk+GzJx
 oXQz/2Be+hdL2+oK7Udldx359AsCti5TLgpnaXXyfwEUJ5spkwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHec9l52w2PM3KVyOREZZGq3V9lZIssfOlC33ToFp6WNNNbWul
 flG8dJm5kspwaU3RldNIp+nmvKSZZVrTMm2rJDNLK1A0RAW7uCH47ff8/+/z4/nw0rhonPCn
 FYnnOHWiTCnmCYj6p+KAzdHHuuRbdU4vNDdeAND9z1YSVTW/xlCRI5tA9zpek2i08wuFnE9s
 GBo3DPGQw1FNod56PYksIwMkettYxEO6ga8kurvwkESdxjVopvsXQKWPf1NoeLKJQh09Yzh6
 cy0fQ3+brNS+1ezbgT6cratwYuzotccUazN8olijRctazFd4bG1ZOmuzTmPsRMs7HquvMwO2
 rUXKTlsCjq6IEeyJ45SK85x6S/gpwZm2NzYyuYZJGZx/SWSAPqEO8GnI7IC6bDtPBwS0iLED
 +HliEPMUfnAq6xbpYR9Y8ec75Xn0DcDnd2qJxYLHhMBSfYu7WMV0Y3D20h/3gDNmDNaXv3Sr
 RMwEgOYH8YvMZ8Jhob7AnfswR2DmUCG+yASzHtbdaHBbhUwo7O90kh5eCbsKv7pznNkE84Zz
 wBKbSn7invMC4dyoifTkvvDZ3NX/Of3/oig40nP6OvAxLDMZlpkMy0yGZdtGQJiBH5esUclV
 GmmyNJG7INHIVBptolwSm6SyAPdvCAm2ggbzpKQdYDRoB5DGxauEfYe75CJhnCw1jVMnnVRr
 lZymHaylCbGv0HcsL07EyGXnuASOS+bUSy1G8/0zsPQ1uxUHXxl6dilwVWp2eHTQiQfB0t1Y
 calr0tWtzGlsYsiRv67cgwHM2j4q9pA65fLT1hmN4sLs7Rc2emVQUGhW2PC2/qqZR/vvVy5Q
 Bfn2VJN8qCLzkry5Oubk1up3rbXes86Ujcpcr+OyAUfWhvxwW781bPhma+RURGRwrPG9qyej
 /XuT7KLJGJ1QY0zJL7fP4/HrJOSGwZ3jHzNnS8szH/7+4M2vcOiLVuT6pN0UyBsnjof1cr3p
 tPeTtobisqmo7cUuQUOgVhkNCyQfCVNSmLbqgJNfkxBin6Gn2iJS/Tuq05uJY5VlMA+NqUN1
 XiV7j0z/4J39NRrvEBOaMzJpCK7WyP4BMmZmenwDAAA=
X-CMS-MailID: 20250306074425epcas5p20a08ef2dbd5705a1044fafb8c4a9ec15
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250305091852epcas5p18a0853e85a5ed3d36d5d42ef89735ca6
References: <20250305091246.106626-1-swathi.ks@samsung.com>
 <CGME20250305091852epcas5p18a0853e85a5ed3d36d5d42ef89735ca6@epcas5p1.samsung.com>
 <20250305091246.106626-2-swathi.ks@samsung.com>
 <789ecb2f-dddc-491b-b9f8-5fb89058fd1b@kernel.org>
Cc: devicetree@vger.kernel.org, ravi.patel@samsung.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk,
 pankaj.dubey@samsung.com, gost.dev@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v8 1/2] dt-bindings: net: Add FSD EQoS
 device tree bindings
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
> Sent: 06 March 2025 12:45
> To: Swathi K S <swathi.ks@samsung.com>; krzk+dt@kernel.org;
> andrew+netdev@lunn.ch; davem@davemloft.net; edumazet@google.com;
> kuba@kernel.org; pabeni@redhat.com; robh@kernel.org;
> conor+dt@kernel.org; richardcochran@gmail.com;
> mcoquelin.stm32@gmail.com; alexandre.torgue@foss.st.com
> Cc: rmk+kernel@armlinux.org.uk; netdev@vger.kernel.org;
> devicetree@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> pankaj.dubey@samsung.com; ravi.patel@samsung.com;
> gost.dev@samsung.com
> Subject: Re: [PATCH v8 1/2] dt-bindings: net: Add FSD EQoS device tree
> bindings
> 
> On 05/03/2025 10:12, Swathi K S wrote:
> > Add FSD Ethernet compatible in Synopsys dt-bindings document. Add FSD
> > Ethernet YAML schema to enable the DT validation.
> >
> > Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> > Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> > Signed-off-by: Swathi K S <swathi.ks@samsung.com>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |   5 +-
> >  .../bindings/net/tesla,fsd-ethqos.yaml        | 118 ++++++++++++++++++
> >  2 files changed, 121 insertions(+), 2 deletions(-)  create mode
> > 100644 Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
> >
> 
> I tried and did not see any differences, so point me exactly to any difference
> in the binding (binding!) which would justify dropping review?

Added the following in the example given in DT binding doc:

assigned-clocks = <&clock_peric PERIC_EQOS_PHYRXCLK_MUX>,
                                <&clock_peric PERIC_EQOS_PHYRXCLK>;
assigned-clock-parents = <&clock_peric PERIC_EQOS_PHYRXCLK>;

Given the significance of these changes, I assumed the changes need to be reviewed again.
That was why the tag was removed. Please correct me if I am wrong and provide your feedback on this patch.

- Swathi

> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
