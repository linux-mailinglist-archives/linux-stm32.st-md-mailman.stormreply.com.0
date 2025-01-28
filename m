Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97545A20B06
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2025 14:14:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B7F1C78026;
	Tue, 28 Jan 2025 13:14:01 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4263EC7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 13:13:53 +0000 (UTC)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20250128131349epoutp04ddf672a463d142c474e00e0ee7194126~e3Xu8eXgY1649316493epoutp04s
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 13:13:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20250128131349epoutp04ddf672a463d142c474e00e0ee7194126~e3Xu8eXgY1649316493epoutp04s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738070029;
 bh=rVoxDSn/mnfeIHuzjRNlI7IvBiNM2DlmF8PSTKMt7ss=;
 h=From:To:Cc:Subject:Date:References:From;
 b=hcfWlujYzJPha+yhGO/k3WdAvQ7q4vZpUZtLFoItl4Z0zoimhNMNJLh1aD1jZUkkQ
 X/eTULmflMZJ+rmGRnAOKJRTgIrGz5b6mcTNEB1bmGY4YfF/iBcVpeOEkjmcQsrGop
 fskfY7LyGat3QlRI9AHUTwjY3F15SGDNpmKBq1Y4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20250128131348epcas5p3f646be962cec0bf0cb12bbe975aed698~e3XuAAw7p1168111681epcas5p3f;
 Tue, 28 Jan 2025 13:13:48 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.174]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Yj5Mb31t2z4x9Pt; Tue, 28 Jan
 2025 13:13:47 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F4.06.20052.B08D8976; Tue, 28 Jan 2025 22:13:47 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20250128102707epcas5p154db286b06da942e18ffe315e4767707~e1GLMeRUr0919409194epcas5p1B;
 Tue, 28 Jan 2025 10:27:07 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250128102706epsmtrp1b0558ff1f199840ffe6e5733277efa27~e1GLLg74X0859008590epsmtrp1i;
 Tue, 28 Jan 2025 10:27:06 +0000 (GMT)
X-AuditID: b6c32a49-3d20270000004e54-8f-6798d80b9fad
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 7A.DC.33707.AF0B8976; Tue, 28 Jan 2025 19:27:06 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250128102703epsmtip1160dfc5bf2fe8cfa244a9aa043cf0775~e1GHjlYEJ1806518065epsmtip1n;
 Tue, 28 Jan 2025 10:27:02 +0000 (GMT)
From: Swathi K S <swathi.ks@samsung.com>
To: krzk@kernel.org, robh@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 conor+dt@kernel.org, richardcochran@gmail.com, mcoquelin.stm32@gmail.com,
 andrew@lunn.ch, alim.akhtar@samsung.com, linux-fsd@tesla.com
Date: Tue, 28 Jan 2025 15:55:54 +0530
Message-Id: <20250128102558.22459-1-swathi.ks@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0WTe0zbVRTHvb9fX5R0/sZwu2PySM0cI8KoK/VCQOck7DeRBV9oUNI18KMl
 QFv7AIUgyB4Cy8pQMQ0DBIYGGAgU6ErHozy2ZSivCAhqCbDieEwYg5gNxmrXlvnf55zzPfd7
 cu69LNztLsODlSRVUQqpKIXLYNP0fYcP+btOasWBW1p39Gjxe4BmyvUMNGzuxVF95xCGSofP
 0tAP/UN0NH9zjommTO0Y6h+oxtB01QodDQ83MdGIXkNHujsTdDS79BH6zVjKQNrhLgwVTFjo
 qHy7gY5uVuxF//5yD6Cqtg0msi63ATR7v4OJSkYMdNT/6wKOrB0GJqqaqaCjjeYp5rEXydba
 KYycL2xjku0lZiZZoVOTurp8BtlSnU22G9YxcrVrnEFqWusA2dPFI+cfduJka/c6IJ/kljHJ
 dZ1X9K7Y5FAJJUqgFD6UNF6WkCQVh3Ej3xe+JQwSBPL8ecHoNa6PVJRKhXHD34n2j0hKse2F
 65MmSlHbUtEipZJ75PVQhUytonwkMqUqjEvJE1LkfHmAUpSqVEvFAVJKFcILDHw1yCY8nSxZ
 vLxKlxvYnxf1DWI5wMQqAC4sSPBhieUnvACwWW7EdQC/3e5nOIIHAFqHntCfBZsTlfSdlnOF
 Vqaj0A7g6EqTs38DwIf5s+CpikH4wt9rrtlV7kQOBr/5Z9SuwoluHE5p5mlPVXuI43DwltHO
 NOIg3L78yM4cIgTeqB/AHH7e8GqTyd4MiTMu8KuFetxRCIdFjyeZDt4Dl261OtkDLhaed7IQ
 XtWM0xwsgebNIoaD34CmsVJbnmWb6DBsNB5xpD1h8cDPdl+c2AUvblmcM3CgoXyHX4LbyxPO
 I/dD/Y+rTisSll6x2tmNiIOP/1yjXQKeJf87VABQB/ZTcmWqmFIGyXlSKv3ZXcXLUnXA/uL9
 ThqAeeZ+QC/AWKAXQBbOdefEDWnFbpwE0RcZlEImVKhTKGUvCLLtrAj3eCFeZvsyUpWQxw8O
 5AsEAn7wUQGPu49zpv2s2I0Qi1RUMkXJKcVOH8Zy8cjBorzZEv7dFVoY2PfHWPMJk67lUlFn
 +LFT4TUF2/7ji3u7/efCXDMMsYMfpoekatk6o94lD0Zhh2bN+jVfTVxmQZbo6Me91lGeb3Eo
 bdXb6OW6QH1ZE/N35LlwXkRWmoHTknO94cDgtCy3s7Hs+RsLvuYV3Lf+dl4bwy+2+A7G/zS7
 40Dl7uzaB7vfvqLraTybm/lJsfH45thJyweNt6snO01+lhjhm+zqgYG/Wr9OvJY1kl+YIeg5
 32C92K9Z6omonH3X6+XTnsvqvL617MGtLmkFjHklsk5ruZAZl9hMq5tLC43PCY1pSi+rfS76
 s6hTQQdZ+femv/PxyL2QbtBlJr7HpSklIp4frlCK/gNcVkjpegQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42LZdlhJTvfXhhnpBn9fmVr8fDmN0eLBvG1s
 FufvHmK2WLP3HJPFnPMtLBbzj5xjtXh67BG7xc0DO5ksjpxawmRxb9E7Vovz5zewW1zY1sdq
 senxNVaLh6/CLS7vmsNmMeP8PiaLrmtPWC3m/V3LanFsgZjFt9NvGC0Wbf3CbvH/9VZGi4cf
 9rBbzLqwg9XiyJkXzBb/9+xgt1j0YAGrxZeNN9kdZDy2rLzJ5PG0fyu7x85Zd9k9Fmwq9di0
 qpPNY/OSeo+dOz4zebzfd5XNo2/LKkaPg/sMPZ7+2MvssWX/Z0aPf01z2T0+b5IL4IvisklJ
 zcksSy3St0vgyng5+z1rwQ6uiomHzzI1MB7g6GLk5JAQMJFo7f/P3sXIxSEksJ1R4lJ7ByNE
 QlLiU/NUVghbWGLlv+dQRZ8YJfaua2IDSbAJaEhcX7EdLCEiMIFJYv2n/UwgDrPARWaJ5lMf
 2UGqhAWcJM4e38UCYrMIqEr8nf0TzOYVsJI4uuYUE8QKeYnVGw4wT2DkWcDIsIpRNLWgODc9
 N7nAUK84Mbe4NC9dLzk/dxMjOMq0gnYwLlv/V+8QIxMH4yFGCQ5mJRHezptT0oV4UxIrq1KL
 8uOLSnNSiw8xSnOwKInzKud0pggJpCeWpGanphakFsFkmTg4pRqYhJTWNFiud7oeEcVX2W8a
 t3fFaefKVq07C9y3Hz2y/N7lEI9XsnIri57WWrpreMt+1BOyTnp8cOfxOwc3enj1Oj8ONU1Z
 Yvr2b+DOU53NVfPOhLxTeGWfNMvww8PZt/dWmkxgdi64ru2s/v1i9j2e6X+u3Uh4s1DmkZHW
 2uSzMRtv1ZpdeLn9hKe2kWzCpeRkvdPrv1nqqvc9k2b8WTyVZ4mz+OoZ3qElh7mNgx0Eo/3/
 GgqpH7nW9HCm4mK1Mz+3HNnqpbulPF3crt101uO9n/il9BvUXu2wtK+Yaf4sMvFmCnNa+P05
 DtL7luevzl7BFvNr2+kpK3sU0xd/mb3TJaeK6/RZrd/L1rI3CFVsVGIpzkg01GIuKk4EAHNY
 hBMhAwAA
X-CMS-MailID: 20250128102707epcas5p154db286b06da942e18ffe315e4767707
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250128102707epcas5p154db286b06da942e18ffe315e4767707
References: <CGME20250128102707epcas5p154db286b06da942e18ffe315e4767707@epcas5p1.samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 ravi.patel@samsung.com, rcsekar@samsung.com, netdev@vger.kernel.org,
 jayati.sahu@samsung.com, ssiddha@tesla.com, linux-kernel@vger.kernel.org,
 swathi.ks@samsung.com, joabreu@synopsys.com, pankaj.dubey@samsung.com,
 peppe.cavallaro@st.com, gost.dev@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 0/4] net: stmmac: dwc-qos: Add FSD EQoS
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

FSD platform has two instances of EQoS IP, one is in FSYS0 block and
another one is in PERIC block. This patch series add required DT binding,
DT file modifications and platform driver specific changes for the same.

Changes since v4:
1. Avoided switching between internal and external clocks for every open/
close.
2. Addressed the review comments on DT bindings

Here is the link to v4 patches for reference:
https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=&submitter=211782&state=&q=&archive=true&delegate=

Swathi K S (4):
  dt-bindings: net: Add FSD EQoS device tree bindings
  net: stmmac: dwc-qos: Add FSD EQoS support
  arm64: dts: fsd: Add Ethernet support for FSYS0 Block of FSD SoC
  arm64: dts: fsd: Add Ethernet support for PERIC Block of FSD SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   5 +-
 .../bindings/net/tesla,fsd-ethqos.yaml        |  91 ++++++++++++++
 arch/arm64/boot/dts/tesla/fsd-evb.dts         |  18 +++
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi    | 112 ++++++++++++++++++
 arch/arm64/boot/dts/tesla/fsd.dtsi            |  47 ++++++++
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        |  74 ++++++++++++
 6 files changed, 345 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
