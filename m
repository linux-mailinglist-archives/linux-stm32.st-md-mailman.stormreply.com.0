Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8830C940E48
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jul 2024 11:52:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A29EC6DD96;
	Tue, 30 Jul 2024 09:52:05 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00073C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2024 09:29:01 +0000 (UTC)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240730092859epoutp048036695308eee466d28bce6af8f84712~m85d9A4n70664606646epoutp04i
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2024 09:28:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240730092859epoutp048036695308eee466d28bce6af8f84712~m85d9A4n70664606646epoutp04i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1722331739;
 bh=31+GD5vlbAkLCC/Q9DsLEnRj4m6as6wHHp1x9BJD0mk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=PcBq0Fecjtn0O4hwi2da6wg60AmrDGUx5tD3Lkkf8IiM/JBCOCnb7RDQZxZQm3PX3
 t9h0UL+f1U+1Spwrz4f9f/3e3y7dvfrI4AqjTw5sR1Ae2pm/flSutSHLF6OP+usbIo
 /A6StV2NDugiKHrrxcx7Q61mZvYgQH6C91wYQUdU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20240730092857epcas5p28420822b48605bdd7743175d2c0d0da3~m85cgr7BM2897228972epcas5p2D;
 Tue, 30 Jul 2024 09:28:57 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.182]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4WY9076dkmz4x9Pw; Tue, 30 Jul
 2024 09:28:55 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F4.5E.19863.752B8A66; Tue, 30 Jul 2024 18:28:55 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20240730092847epcas5p1338397b0ec01a4f0c8387704fb390a40~m85Sffr1Z0679006790epcas5p1m;
 Tue, 30 Jul 2024 09:28:47 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240730092847epsmtrp2075aa4b1b9e9d9e476b59f01d603d559~m85Sd9Lfo2616126161epsmtrp2_;
 Tue, 30 Jul 2024 09:28:47 +0000 (GMT)
X-AuditID: b6c32a50-ef5fe70000004d97-d9-66a8b257e3a3
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 01.7D.19367.E42B8A66; Tue, 30 Jul 2024 18:28:47 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
 [107.109.115.53]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240730092843epsmtip257c05d2c5cb84342721117943a0c3902~m85O572Vm2110121101epsmtip2P;
 Tue, 30 Jul 2024 09:28:43 +0000 (GMT)
From: Swathi K S <swathi.ks@samsung.com>
To: krzk@kernel.org, robh@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 conor+dt@kernel.org, richardcochran@gmail.com, mcoquelin.stm32@gmail.com,
 andrew@lunn.ch, alim.akhtar@samsung.com, linux-fsd@tesla.com
Date: Tue, 30 Jul 2024 14:46:44 +0530
Message-Id: <20240730091648.72322-1-swathi.ks@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0WTe0xTVxzHd3rbe1u2kjsecuxgkjLHIPLoRuHgBAnidjdcQrItLg5TOnqh
 jNI2feA2jaukxK1jdeIEwwA7FMNDGdaCBQGxELeAoRpeQwODYhcFxEd1Exmwltbtv8/v9/v+
 zjf5nnPYWIAT57EL5BpaJRfL+Lgfs70vKjJmt7khL35FH4OW7lYANF3bjiP7pA1DZ7uHGKja
 rmeik/1DLOS86iDQRG8HA/UPnGagqbpFFrLbWwl0vd3IQubZMRaamduNhjurcXTC3sNAhrHb
 LFS7co6Frpo2oL8GFwCqa3tMoLX5NoBmHnQRqOq6lYX6r93B0FqXlUB10yYWenx+gkgLpSyN
 EwzKeaSNoDqqJgnKZNZS5qZvcerC6a+pDquLQd3vGcUpo6UJUFd6BJTzaTdGWS67ALVaUkNQ
 LvOrWf57CrdJabGEVoXT8lyFpECen8LP/FC0QyRMjBfECJJREj9cLi6iU/gZu7Ji3imQuXPh
 hxeLZVp3K0usVvPjUrepFFoNHS5VqDUpfFopkSkTlLFqcZFaK8+PldOarYL4+DeFbmFOoVRn
 HsGVq9wvfh6cwnRg8kUDYLMhmQBbhpIMgMMOILsAHHwoMgA/Nz8CcG6tG/MO3MVvxg0e9uiP
 2HS4V9QBYFfFJeAtShmwY6gZeFQ4+QYcb7hIeAZBpI4By+/dwDwFRl7G4ITRyfSoAsl02HfJ
 hHuYSW6G06tLLA9zya2wa3QV9/ptgs2tvevLkDzMgUs/2hneQQZsPOYgvBwI5361+JgHXYvd
 vmURbDaOMr0shZPPjvr622HvSDXTEwBGRsFfOuO87TB4fKBl/XiM9IffL9/2WXGhtfY5R8CV
 +THfkRthe/19ny0F/7bVML157YWldcfADyCs6n8HEwBNgEcr1UX5dK5QKYiR0/v+u6lcRZEZ
 rL/36CwraG5dibUBBhvYAGRj/CCuaKQ+L4ArEX/5Fa1SiFRaGa22AaE7tKMYLzhX4f4wco1I
 kJAcn5CYmJiQ/FaigB/CnS+tkQSQ+WINXUjTSlr1fI/B5vB0DLa6xlLCydaNfmNI27vjM45j
 +8F56+EHplOtnZmWKxFEdIlg//EMbuXycPnUTOj4qbn6nAlHQEgV73PivbF9nZHREdc+QtNn
 2w8ZhR/svJuDxOl/xp1Z1kcLJhucNakVv0tGHr08+/GJ2uUtiwv7q7XntjwRjjnexcNK+2yZ
 2Q8uui5I96CbZWVLLZtApqN3J3nmICfYry9o81Jw8b3lf4aTbvql3dHXDUaen865xR4uGag0
 BPKj9AtFT6JeebtCXPwJ50DeiGtm9sBJfVD20xBTTl9/5YyjvPD9G3/wftqIv/7sBZnIP/Xh
 rSSqgql+rSx9V+hLhJ8iqf9QdeOnlr7x4u/4TLVULIjGVGrxvzxwzHJ4BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42LZdlhJXtd/04o0g11bmS1+vpzGaPFg3jY2
 i/N3DzFbrNl7jslizvkWFov5R86xWjw99ojd4uaBnUwWR04tYbK4t+gdq8X58xvYLS5s62O1
 2PT4GqvFw1fhFpd3zWGzmHF+H5NF17UnrBbz/q5ltTi2QMzi2+k3jBaLtn5ht/j/eiujxcMP
 e9gtZl3YwWpx5MwLZov/e3awWyx6sIDV4svGm+wOMh5bVt5k8njav5XdY+esu+weCzaVemxa
 1cnmsXlJvcfOHZ+ZPN7vu8rm0bdlFaPHwX2GHk9/7GX22LL/M6PHv6a57B6fN8kF8EVx2aSk
 5mSWpRbp2yVwZTRsusJW8I+3YuHpe8wNjHe5uxg5OSQETCT6DzWwgdhCAtsZJe7vKoOIS0p8
 ap7KCmELS6z895y9i5ELqKaZSeLEj3csIAk2AQ2J6yu2gyVEBCYwSaz/tJ8JxGEWuMgs0Xzq
 IztIlbCAk8Th3QvAVrAIqEo8+PcTbCyvgJXEnqv/2CBWyEus3nCAeQIjzwJGhlWMoqkFxbnp
 uckFhnrFibnFpXnpesn5uZsYwTGmFbSDcdn6v3qHGJk4GA8xSnAwK4nwxl9ZmibEm5JYWZVa
 lB9fVJqTWnyIUZqDRUmcVzmnM0VIID2xJDU7NbUgtQgmy8TBKdXAlJnZf6dALtd+ZmC6+uas
 kvOa602f+C1Nfit/ZnrBjXeeLKr3Vtxi3GU+76BijtPXhdeOzjcTNFmz2CD6Rb30tPhufpn6
 s1ISJ/OuHt0ya7e0T37TrZL7GSuu87+ZX8phYSJyKjq5vF5W/r1HZ92WqYcv7Hmt7y31zvZW
 YmxO7XP/Rerrma2af3hPdfnkIBT1K3nSl6rtEy6Z/bj3/oX/Ab2nASYf+3qPbo285bza9Pl3
 9mkS65esst/YtmHesew1Z0/pxnk/qdliXNu0c+nGD8FLA6tffeNZd0iruF0tM+qW+rGvFazt
 c5RO/T/ZEhceaPTp1N8/y/5v3tu8fs1Pq/MXmux7bdZdjMg/+UDtq6YSS3FGoqEWc1FxIgBs
 IvW7IAMAAA==
X-CMS-MailID: 20240730092847epcas5p1338397b0ec01a4f0c8387704fb390a40
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240730092847epcas5p1338397b0ec01a4f0c8387704fb390a40
References: <CGME20240730092847epcas5p1338397b0ec01a4f0c8387704fb390a40@epcas5p1.samsung.com>
X-Mailman-Approved-At: Tue, 30 Jul 2024 09:52:04 +0000
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 ravi.patel@samsung.com, rcsekar@samsung.com, netdev@vger.kernel.org,
 jayati.sahu@samsung.com, ssiddha@tesla.com, linux-kernel@vger.kernel.org,
 swathi.ks@samsung.com, joabreu@synopsys.com, pankaj.dubey@samsung.com,
 peppe.cavallaro@st.com, gost.dev@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/4] net: stmmac: dwc-qos: Add FSD EQoS
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SD platform has two instances of EQoS IP, one is in FSYS0 block and
another one is in PERIC block. This patch series add required DT binding,
DT file modifications and platform driver specific changes for the same.

Changes since v3:
1. Avoided using alias-id to configure the HW.
2. Addressed the review cooments on DT files given by Krzysztof
3. Modified the clock implementation.

Here is the link to v3 patches for reference:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20230814112539.70453-2-sriranjani.p@samsung.com/
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20230814112539.70453-3-sriranjani.p@samsung.com/
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20230814112539.70453-4-sriranjani.p@samsung.com/
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20230814112539.70453-5-sriranjani.p@samsung.com/

Swathi K S (4):
  dt-bindings: net: Add FSD EQoS device tree bindings
  net: stmmac: dwc-qos: Add FSD EQoS support
  arm64: dts: fsd: Add Ethernet support for FSYS0 Block of FSD SoC
  arm64: dts: fsd: Add Ethernet support for PERIC Block of FSD SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   5 +-
 .../devicetree/bindings/net/tesla,ethqos.yaml |  91 ++++++++++++++
 arch/arm64/boot/dts/tesla/fsd-evb.dts         |  18 +++
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi    | 112 ++++++++++++++++++
 arch/arm64/boot/dts/tesla/fsd.dtsi            |  47 ++++++++
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        |  90 ++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  28 ++++-
 include/linux/stmmac.h                        |   1 +
 8 files changed, 388 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/tesla,ethqos.yaml

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
