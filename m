Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC82A21BE7
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 12:15:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17B73C78F65;
	Wed, 29 Jan 2025 11:15:32 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4A57C78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 11:15:30 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20250129111528epoutp04707be8685b04f9a40ba53ec0916d6155~fJZrywSQ91133611336epoutp04e
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 11:15:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20250129111528epoutp04707be8685b04f9a40ba53ec0916d6155~fJZrywSQ91133611336epoutp04e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738149328;
 bh=xGuALcrPuSIk/tk+ACOlUB8rfuEt7Bvx3muPFTz4zHE=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=rsGLB8N6va6oUb3YqxGVT2IOpORfLhi4/PlOznnJIPedlqMZI//gP8WVO24JGsuUE
 rVqfAvq60Gw6O4RQSOLOVeMjHiNbM2wLcNmMiUSUiKH0aNWiN1qapE0JQQYhWbtJvp
 8T2QUFPYOLmmcBqQBnjVnIXMNV/0eZ7lB4msCskE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20250129111528epcas5p4ece79fb77edd90a7a080715fceb8fc57~fJZrScBPq1814118141epcas5p47;
 Wed, 29 Jan 2025 11:15:28 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.175]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4YjfhY7429z4x9Pw; Wed, 29 Jan
 2025 11:15:25 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 E6.71.29212.DCD0A976; Wed, 29 Jan 2025 20:15:25 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20250129091811epcas5p338ea019f7d192f9105b9439da53abbaa~fHzR7Mapz0667606676epcas5p36;
 Wed, 29 Jan 2025 09:18:11 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250129091811epsmtrp2b18e9e73296966f0b490b888948628d5~fHzR42lxZ0365703657epsmtrp2B;
 Wed, 29 Jan 2025 09:18:11 +0000 (GMT)
X-AuditID: b6c32a50-801fa7000000721c-2d-679a0dcd7119
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 77.13.23488.352F9976; Wed, 29 Jan 2025 18:18:11 +0900 (KST)
Received: from FDSFTE596 (unknown [107.122.82.131]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20250129091807epsmtip2f010d378103714dd2c89521cab520491~fHzOT0pot1058210582epsmtip2s;
 Wed, 29 Jan 2025 09:18:07 +0000 (GMT)
From: "Swathi K S" <swathi.ks@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
In-Reply-To: <1da56c20-c522-428e-81ff-bc2f9ee0f524@kernel.org>
Date: Wed, 29 Jan 2025 14:48:05 +0530
Message-ID: <002d01db722e$b6fc4610$24f4d230$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQDx5RsunPn3lkU9PtjwM0wRa6rGBAHz93duAhzDMjcC64gLR7TIsIcg
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta1BUZRieb8+ePYsGHbl+4Vh0igqaBVZg+yBAQsY5A8yIOFrROLjCaZeA
 3WUvCpaDgaYQETaT2HK/iIIhuAIuBLQCkUGy4AUxRZHLgAsBBjFQQ7bsgeLf8z7zvO/zPu83
 Hx+zrSKc+fEyNaOUiRMp3iZuY4ebm+CmtVbi1TnvjZafngVouKiRh4xD7Rj6vrWXgwqMJ7io
 uLMXR+NdIwS6b2jioM7uCg56VDaDI6OxjkB9jTk40o0O4OiJ6X10u7mAh84Z2zgoa2AMR0Ur
 NTjqKnFEiz3TAJU1LBDo+VQDQE/mWgik7dPjqPPXSQw9b9ETqGy4BA/eStdX3efQ4183EHST
 doigS3QaWledyaOvVqTRTfp5Dj3bdpdH59RXA/p6m5AeX2rF6Pof5wH9T3ohQc/rXo60iU4I
 kDLiOEbpwshi5XHxMkkgFb43ZmeMr8hLKBD6oXcoF5k4iQmkQiMiBbviE80noVwOixM1ZipS
 rFJRnkEBSrlGzbhI5Sp1IMUo4hIVPgoPlThJpZFJPGSM2l/o5bXd1yw8mCCdyj8FFPkOKXla
 I34cNJNZwIoPSR94cuk0ngU28W3JFgB/r63issUfAN563EywxSKAk7pF3nqLob56TdUK4Kmh
 XowtJgGs7Z/krqp4pDssy2kjVrE9KYBXBy9YRmFkDw4NDRmWUVZkEDx/OR9fxXbkHlg8mGPh
 uaQrvNb/pYW3Jv3gg6JhwOIt8JfvxiwGGPk2rCydwtiVXODyeKVZzzeb7YLP7n3ASpzgT8vZ
 luUgOWIFLy7eAKw+FHY0NOEstoOmn+sJFjvD+ZnWtZgx8FLOXS6LpXDorzNr/A5ouFPAXfXC
 SDdY2+zJ0tvgt92XOayvDfzq7zEOy1tDfdE6fg2uTA2sjXwJNp6fJXIBpd2QTLshmXZDBO3/
 biWAWw2cGYUqScLE+iqEAhlz5L8nj5Un6YDlz7hH6sGluhWPdsDhg3YA+Rhlb32g95zE1jpO
 nHqUUcpjlJpERtUOfM33PoM5O8TKzZ9Opo4R+vh5+YhEIh8/b5GQcrLOaDohsSUlYjWTwDAK
 Rrnex+FbOR/nuORFEYKu/pNOi0EXDnk//IIvjdiSPPMoJC+uYsTV9KnmldKUd1OCI9xT02v2
 v35wCd6yCXhosNvfpw+bGTeFf/OYwt6zK2gOmWiVyrfibkfl2UYJmTGdLrG/FnD9zcEjVccO
 dS9kbtMkeu29UprqP6xsrsErO3qCx23Alew5LDo32uHzBdVoXd32j0dbpTdf1e8+ra54sFnk
 9uJvsYUl1FPXP9vPRh6YixI57pYYZtMycpTpe3h3QvbZbr6dHXYjdLDNc+LDnYWfhO7TaArC
 ZP3toWnJHs8k4Unl5UuGkR0vTF/8gbj3mf8buqJcTUpyZlXY4beWTRNM+cQxUxSv+CPHSgHF
 VUnFQndMqRL/C7mz+EC8BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleLIzCtJLcpLzFFi42LZdlhJXjf408x0gxMf+Cx+vpzGaPFg3jY2
 i/N3DzFbrNl7jslizvkWFov5R86xWjw99ojd4uaBnUwWR04tYbK4t+gdq8X58xvYLS5s62O1
 2PT4GqvFw1fhFpd3zWGzmHF+H5NF17UnrBbz/q5ltTi2QMzi2+k3jBaLtn5ht/j/eiujxcMP
 e9gtZl3YwWpx5MwLZov/e3awWyx6sIDVQdpjy8qbTB5P+7eye+ycdZfdY8GmUo9NqzrZPDYv
 qffYueMzk8f7fVfZPPq2rGL0OLjP0OPpj73MHlv2f2b0+Nc0l93j8ya5AL4oLpuU1JzMstQi
 fbsEroyOQzvYCs6KVDxfvYO1gfENfxcjJ4eEgInEgS2rWLoYuTiEBHYzShzds4ARIiEp8al5
 KiuELSyx8t9zdhBbSOAZo8TtaUUgNpuAlsSivn1gcREBXYnNN5aD2cwCL1kljq6JgBj6llFi
 5ZMtYEM5Bewklq6bDTZUWMBfYtqlg2A2i4CqxPaL3WA2r4ClxO15DxghbEGJkzOfsEAM1Zbo
 fdjKCGMvW/iaGeI4BYmfT5cB9XIAHeEm8fF6BESJuMTRnz3MExiFZyGZNAvJpFlIJs1C0rKA
 kWUVo2RqQXFuem6yYYFhXmq5XnFibnFpXrpecn7uJkZwktHS2MH47luT/iFGJg7GQ4wSHMxK
 Iryx52akC/GmJFZWpRblxxeV5qQWH2KU5mBREuddaRiRLiSQnliSmp2aWpBaBJNl4uCUamBK
 vVkhe6vuGefvOrmJWjr+u2/EVq7fN/fJrwfKUnOlBbXrN1/7yHGu5wuf+faeyIq+0wGK03m4
 um52fLyS4qy/xCo4P8bUgpvrwfVnZapC/Gr/Wo6dMbn9zeDMgrUHYsTvCLUzRAi3uy+baxSQ
 1nC0b/HX3Z7Mkzj/cvhztQe+ejSn1mfKGvWue17XP6c9DBDi2b3ZzzuAl3tyVtaH07U+s+6v
 qfDj+ujO1i98fpPrjFCXW7ePTGp9YR2+O9hZsrpq58najU8d+TMX8na63Nd6c0rl6vcvUpMv
 r4w/kM7yN3dJYje3wqt7gSIMKozJ0/frvrnxeTWf6P4pN5JvPN5enll65qTAqlqZpKUFX+Yo
 sRRnJBpqMRcVJwIAzQB4eqEDAAA=
X-CMS-MailID: 20250129091811epcas5p338ea019f7d192f9105b9439da53abbaa
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250128102725epcas5p44b02ac2980a3aeb0016ce9fdef011ecf
References: <20250128102558.22459-1-swathi.ks@samsung.com>
 <CGME20250128102725epcas5p44b02ac2980a3aeb0016ce9fdef011ecf@epcas5p4.samsung.com>
 <20250128102558.22459-2-swathi.ks@samsung.com>
 <1da56c20-c522-428e-81ff-bc2f9ee0f524@kernel.org>
Cc: andrew@lunn.ch, jayati.sahu@samsung.com, edumazet@google.com,
 linux-fsd@tesla.com, alim.akhtar@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 linux-samsung-soc@vger.kernel.org, ssiddha@tesla.com, pankaj.dubey@samsung.com,
 joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, ravi.patel@samsung.com,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, rcsekar@samsung.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, gost.dev@samsung.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v5 1/4] dt-bindings: net: Add FSD EQoS
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
> Sent: 28 January 2025 19:45
> To: Swathi K S <swathi.ks@samsung.com>; robh@kernel.org;
> davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
> pabeni@redhat.com; conor+dt@kernel.org; richardcochran@gmail.com;
> mcoquelin.stm32@gmail.com; andrew@lunn.ch; alim.akhtar@samsung.com;
> linux-fsd@tesla.com
> Cc: netdev@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com;
> linux-arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org;
> alexandre.torgue@foss.st.com; peppe.cavallaro@st.com;
> joabreu@synopsys.com; rcsekar@samsung.com; ssiddha@tesla.com;
> jayati.sahu@samsung.com; pankaj.dubey@samsung.com;
> ravi.patel@samsung.com; gost.dev@samsung.com
> Subject: Re: [PATCH v5 1/4] dt-bindings: net: Add FSD EQoS device tree
> bindings
> 
> On 28/01/2025 11:25, Swathi K S wrote:
> > +  Tesla ethernet devices based on dwmmac support Gigabit ethernet.
> > +
> > +allOf:
> > +  - $ref: snps,dwmac.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: tesla,fsd-ethqos.yaml
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 5
> > +    maxItems: 10
> 
> Why is this flexible?
> 
> Anyway, you need to list and describe the items instead of min/maxItems.

Hi Krzysztof,
There are 2 Ethernet instances where Eth0 has 5 clocks and Eth1 has 10 clocks.
Would it be sufficient to list the clock names?

> 
> > +
> > +  clock-names:
> > +    minItems: 5
> > +    maxItems: 10
> 
> Same here.

Ack

> 
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  phy-mode:
> > +    enum:
> > +     - rgmii-id
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - iommus
> > +  - phy-mode
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/fsd-clk.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    ethernet_1: ethernet@14300000 {
> 
> Please implement last comment from Rob.
> 
> > +              compatible = "tesla,fsd-ethqos";
> > +              reg = <0x0 0x14300000 0x0 0x10000>;
> 
> And since there is going to be new version, switch to the preferred
> indentation (4-space). Other option is 2 spaces, but not 8.

Ack, will update it this way in v6.

- Swathi

> 
> > +...
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
