Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2319A3D21F
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Feb 2025 08:24:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B2D7C78F8B;
	Thu, 20 Feb 2025 07:24:06 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8B90C78F6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2025 07:24:03 +0000 (UTC)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20250220072401epoutp046d7d5da27f9d857ddb775d20a7fc3d56~l2b4AKBEq0422404224epoutp04c
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2025 07:24:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20250220072401epoutp046d7d5da27f9d857ddb775d20a7fc3d56~l2b4AKBEq0422404224epoutp04c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1740036241;
 bh=gzDZdnsCspvTZeSgVAXe6lE4XfFNW/yTAr5n04ZTuIU=;
 h=From:To:Cc:Subject:Date:References:From;
 b=POnHLO5WgHkpI7qD9I4z/8UdlGtVUc1Ep84rIiGQ3qW2YPwWY6s0N7ZG9VQXW64a+
 Z48AgTee3mgSgOv75trEe1Xd8MB/CzLGmhceecZUNehFUUKo4P6cWwI5fJ2TGBa+s8
 CTLvMNXux5uHDHLftn4y74PMhmB4KfwbpC5mLUj8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20250220072400epcas5p4e25dba29d9d99c5f3e15deb142702f77~l2b3dXuXz0862408624epcas5p4D;
 Thu, 20 Feb 2025 07:24:00 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.179]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4Yz4WK18n8z4x9Q8; Thu, 20 Feb
 2025 07:23:57 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 3D.C8.29212.B88D6B76; Thu, 20 Feb 2025 16:23:55 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20250220044123epcas5p1eb9f906067a6e2585f9e4598653857fd~l0N4iKwtB0786207862epcas5p10;
 Thu, 20 Feb 2025 04:41:23 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250220044123epsmtrp2866a5d8ce254ede85ffe37d9571754c6~l0N4gyFPY0490204902epsmtrp2I;
 Thu, 20 Feb 2025 04:41:23 +0000 (GMT)
X-AuditID: b6c32a50-801fa7000000721c-a0-67b6d88b6690
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 1A.ED.18949.372B6B76; Thu, 20 Feb 2025 13:41:23 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250220044120epsmtip1b0ee07b1118b6ede1390ae3fe28da517~l0N1vbGDN1683716837epsmtip1i;
 Thu, 20 Feb 2025 04:41:20 +0000 (GMT)
From: Swathi K S <swathi.ks@samsung.com>
To: krzk+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Date: Thu, 20 Feb 2025 10:07:10 +0530
Message-Id: <20250220043712.31966-1-swathi.ks@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA0VTe0xTVxjPubcv2GpuUPTYTdZc4wJk1NaVciC8ZM5cnDoWXZYQl9rAXXmU
 29oWRZaJbgwdU6SKzgEiURgK41VLeQwIDwdEFkUoReJ0wHiIIu8RQAlradn++32/7/d9v+98
 5xwe7vYbR8CLZfS0llGoSI4ry9zq5e3z42OzUtx3jkBL41cBKhqoYaNfGx5gKPdhKgvduPeA
 jUbahriov6kWQ+PZzzioy5zBRsa/rWzUU5fLQenWYTbKWyllo7b8zWihcwKgm1XzXDQ4Xc9F
 9/54jqPuiwYMrdbXcNF8ZT831J3qsT7CKdOdfowauVjFpWqzn3KpfGMiZSz+gUPdLUihamvm
 MGqqsZdDZZiKAdXcKKHmjB4Rb0fGB8bQimhaK6SZKHV0LKMMIj85JP9I7isTS3wk/siPFDKK
 BDqI3LM/wmdvrMp2VlJ4XKFKtFERCp2O3BkcqFUn6mlhjFqnDyJpTbRKI9WIdIoEXSKjFDG0
 PkAiFu/ytQmPxsc0/Hwe17RuSBodN+KnwZu30oELDxJS2Le6yLFjN6IewNFv3dOBqw3PAmgZ
 TAOOYAHAuZUqznrFtawRriPRAOBr8xLbEcwD2F2dCewqDuEJ+25Xr6k2EcsATl/qxO0BThRh
 sHPAgttVG4kweDa3ALNjFrEDNppLWXbMJwLg8OQMy+H3HiypaForhkQHD76pyAGOxB74avV3
 tgNvhC/aTVwHFsC5yQbnsHJYktHrbBQDny4bnHwIbLLk2niebSIvWF6300Fvg1ful63NgxMb
 4IXXw5iD58OavHW8Ha68tDpbboXmwimnLQX/6ijlOjb5Jcy5XczJBNuy/3fIB6AYCGiNLkFJ
 R/lqJD4MfeK/u4pSJxjB2iv2jqgBJRUrohaA8UALgDyc3MRPSzEp3fjRipPJtFYt1yaqaF0L
 8LUtzYAL3KPUtm/A6OUSqb9YKpPJpP4fyiTkFv53talKN0Kp0NPxNK2htet1GM9FcBpDYJ/1
 T4+4GTidNnHglKiZPLJ0uWX6QE/Pk6G22Mqzo188z/q4iB+X3nt30JB6deL9X6qZ6e6qr8w9
 V0Ld3j2cXVc3mm6+5Rn09ZZXhR9MbT24W/Z4aOz6O7MXQPvYcMPsbraXKvbO0WdlLskDXmHC
 yZlrpoFTxvO5gSk/CS0Vh1wjLbt6T9YvZKZ03MqS+ondm3ldYSEPRwvpyM3lOX0Gl/4X1d6+
 90WW+uh/ysMJzwC/sW/mzw18XxSexAQ/kofksF7u7zpmelKwT97sn/xpfn7RsdXPyy7HtfpV
 thAnmo+Hfda316NuomPHYX64380y9eKiV6hJcGY5qX02eOLI9bwzlwwkSxejkHjjWp3iX8JM
 AaJOBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGLMWRmVeSWpSXmKPExsWy7bCSnG7xpm3pBtMuilj8fDmN0WL5gx2s
 Fmv2nmOymHO+hcVi/pFzrBZPjz1it7h5YCeTxctZ99gsLmzrY7XY9Pgaq8XlXXPYLLquPWG1
 mPd3LavFsQViFt9Ov2G0WLT1C7vFww972C2OnHnBbHGpfyKTxf89O9gtvmy8ye4g6nH52kVm
 jy0rbzJ5PO3fyu6xc9Zddo8Fm0o9Nq3qZPPYvKTeY+eOz0we7/ddZfPo27KK0ePgPkOPz5vk
 AniiuGxSUnMyy1KL9O0SuDL2zuxhLjjMV/Hs5SbmBsY/3F2MnBwSAiYSM6Y8Ze9i5OIQEtjN
 KPHp8U5GiISkxKfmqawQtrDEyn/PoYo+MUqsPDQXrIhNQEPi+ortYAkRgQ4miT1TTzKDOMwC
 G5kkjl3azA5SJSzgJNE+ZwkTiM0ioCqxb9taFhCbV8BK4sm7jywQK+QlVm84wDyBkWcBI8Mq
 RsnUguLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzgqNDS2sG4Z9UHvUOMTByMhxglOJiVRHjb
 6rekC/GmJFZWpRblxxeV5qQWH2KU5mBREuf99ro3RUggPbEkNTs1tSC1CCbLxMEp1cCU93rV
 qQMWM47VnvY4dHvPxBK+K69O2F9/rOt1Rq1ipn1h71qLi0tnXT07yXvzioMdAnFmt4wy6/n0
 U5dHb95WcIllk4RXrMjrDbO4Gp96aR6brtujq3/fp7FZ8xKT+vGy9lmzMr2y1qkZdFxK/zNj
 uajV/qsCv+d4li3MW10ToZL68UXTznd5u7Xud4RqZSX3r1zYXBw/ce7iOM2CiaYd9gabI7dZ
 rMhadbpYWENrVd45b34rrxs9R3d0lrjFlM0NVQsWXCL9aO0fTpG05eunZt84wVL28MHXE3OO
 zJ52OGC+zGXtg1q/UvQrWF4cn3HQZvaO7fLLZH5EBu779GOe+aeTplkuzxo3L1owy3vHZSWW
 4oxEQy3mouJEAD8KrUj5AgAA
X-CMS-MailID: 20250220044123epcas5p1eb9f906067a6e2585f9e4598653857fd
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250220044123epcas5p1eb9f906067a6e2585f9e4598653857fd
References: <CGME20250220044123epcas5p1eb9f906067a6e2585f9e4598653857fd@epcas5p1.samsung.com>
Cc: devicetree@vger.kernel.org, ravi.patel@samsung.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, swathi.ks@samsung.com,
 rmk+kernel@armlinux.org.uk, pankaj.dubey@samsung.com, gost.dev@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 0/2] net: stmmac: dwc-qos: Add FSD EQoS
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
another one is in PERIC block. This patch series add required DT binding
and platform driver specific changes for the same.

Changes since v1:
1. Updated dwc_eqos_setup_rxclock() function as per the review comments
given by Andrew.

Changes since v2:
1. Addressed all the review comments suggested by Krzysztof with respect to
DT binding file.
2. Added SOB Swathi.

Changes since v3:
1. Avoided using alias-id to configure the HW.
2. Modified the clock implementation.

Changes since v4:
1. Avoided switching between internal and external clocks for every open/
close.
2. Addressed the review comments on DT bindings

Changes since v5:
1. Addressed the review comment on correcting the intendation.
2. Corrected the compatible name in dt-binding file.
3. Listed and described the clocks in dt-binding.
4. Modified FSD probe as per the changes in the refactoring patch given
below: https://lore.kernel.org/netdev/20250207121849.55815-1-swathi.ks@samsung.com/

Changes since v6:
1. Addressed review comments by Krzysztof on dt-binding file regarding
clock-names property
2. Corrected indentation issue in dt-binding
3. Addressed Andrew's comment on listing phy-modes.

Here is the link to v6 patches for reference:
https://lore.kernel.org/netdev/20250213044624.37334-1-swathi.ks@samsung.com/

Swathi K S (2):
  dt-bindings: net: Add FSD EQoS device tree bindings
  net: stmmac: dwc-qos: Add FSD EQoS support

 .../devicetree/bindings/net/snps,dwmac.yaml   |   5 +-
 .../bindings/net/tesla,fsd-ethqos.yaml        | 115 ++++++++++++++++++
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        |  28 +++++
 3 files changed, 146 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
