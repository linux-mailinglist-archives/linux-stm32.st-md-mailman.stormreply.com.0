Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC7BA4FF20
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Mar 2025 13:57:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C1A6C78037;
	Wed,  5 Mar 2025 12:57:26 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1F18CFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 12:57:24 +0000 (UTC)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20250305125721epoutp02bc82dd164fa96c1cd139152baed4b515~p6XolV7zR2159121591epoutp02u
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 12:57:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20250305125721epoutp02bc82dd164fa96c1cd139152baed4b515~p6XolV7zR2159121591epoutp02u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1741179441;
 bh=gJTqKRJTpfqMnnraspq+3qUtcX/v+MUuDyp6qyCY7XA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=TrEiBR+qekez73eASU67U0y/yDFMf9a4B4QZ3x2gWgV0ONTppcAoHtEfS4b+vhCIr
 yjSHEhyC/Hk8BH9UnmjgtLufHxOv3Ckq7Hg0K2GbkrNtgkyVCix1SDv1WR+Zv0/NNV
 jKKFO1T8AEeadxxhDl67y7LVgx4pZTb7LSou6ysM=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20250305125721epcas5p498e06039d06bb7590aa3a595aeb93c36~p6Xn8tLwm1019510195epcas5p4U;
 Wed,  5 Mar 2025 12:57:21 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.176]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Z7CHz2Cztz4x9Pr; Wed,  5 Mar
 2025 12:57:19 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 35.23.20052.F2A48C76; Wed,  5 Mar 2025 21:57:19 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20250305091845epcas5p1689eda3ba03572377997897271636cfd~p3YwvyTxk0290502905epcas5p1W;
 Wed,  5 Mar 2025 09:18:45 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250305091845epsmtrp13ce4349a0492a94ea7ad1411fede4ade~p3YwtnWv21941319413epsmtrp1Q;
 Wed,  5 Mar 2025 09:18:45 +0000 (GMT)
X-AuditID: b6c32a49-3fffd70000004e54-31-67c84a2fd74c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 2E.0F.23488.4F618C76; Wed,  5 Mar 2025 18:18:44 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250305091842epsmtip281fe6bc11cada4780d723a78c6d42ca6~p3Yt_mHXc1556215562epsmtip2x;
 Wed,  5 Mar 2025 09:18:42 +0000 (GMT)
From: Swathi K S <swathi.ks@samsung.com>
To: krzk+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Date: Wed,  5 Mar 2025 14:42:44 +0530
Message-Id: <20250305091246.106626-1-swathi.ks@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBJsWRmVeSWpSXmKPExsWy7bCmlq6+14l0g7OzeC1+vpzGaLH8wQ5W
 izV7zzFZzDnfwmIx/8g5Vounxx6xW9w8sJPJ4uWse2wWF7b1sVpsenyN1eLyrjlsFl3XnrBa
 zPu7ltXi2AIxi2+n3zBaLNr6hd3i4Yc97BZHzrxgtrjUP5HJ4v+eHewWXzbeZHcQ9bh87SKz
 x5aVN5k8nvZvZffYOesuu8eCTaUem1Z1snlsXlLvsXPHZyaP9/uusnn0bVnF6HFwn6HH501y
 ATxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QL8q
 KZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgpMCvSKE3OLS/PS9fJSS6wMDQyMTIEK
 E7IzZr44yF7QIlDx7tJhpgbGybxdjJwcEgImEjdWTGDqYuTiEBLYzSjxcM58KOcTo8TNtX1s
 EM43RokvT18ydjFygLXc/mIP0i0ksJdR4uD6QIiaL4wS+x9dZQRJsAloSFxfsZ0dJCEi8ItR
 4sOk08wgDrPAciaJ0w+uMINUCQs4STw7tQ3MZhFQlfhx8QaYzStgLXF58z02iAPlJVZvOMAM
 YZ/gkHh0WxXCdpG4cf0YE4QtLPHq+BZ2CFtK4mV/G5QdL7G67yoLhJ0hcffXRKiZ9hIHrsxh
 AfmGWUBTYv0ufYiwrMTUU+vARjIL8En0/n4CNZ5XYsc8GFtZ4u/ra1AjJSW2LX0PtcpDYu7f
 g8yQUImVODXxPOsERtlZCBsWMDKuYpRMLSjOTU8tNi0wzEsth0dUcn7uJkZwEtby3MF498EH
 vUOMTByMhxglOJiVRHhfnzqeLsSbklhZlVqUH19UmpNafIjRFBhkE5mlRJPzgXkgryTe0MTS
 wMTMzMzE0tjMUEmct3lnS7qQQHpiSWp2ampBahFMHxMHp1QD07aiRjcOzdlXPn18OllKd5H4
 0v6L2xsPG05Riw/Ve7cofZLu1OR1YTL/TNbvYKi8qMKiEXZcPU387B/TqAkTHmioHN971sA/
 //zNtT6vTjXoNJfzu2hb35zbqRkRF73TLib60Ymy1d/805i9So8/khJd88hak/VQWAu3zqHM
 ZAkdw10lZ0JkP85Ry61cvC0/Zu2UooptT7kf7OJVnMal78lj33e3bEdb7Ebfz9/jS2bM3+G6
 bh17ufnWL7Ln9gWvmOm5JqD6dMOxg1bHoic5/JvAeWjfE9/VwempHZNM8vX2Jj6JY1hfElyX
 VOhVsK7ntkpj3dopBa4tSS2Ojja181taI9aLJGc7zj9ovWKpEktxRqKhFnNRcSIASn7S80sE
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWy7bCSvO4XsRPpBkubbSx+vpzGaLH8wQ5W
 izV7zzFZzDnfwmIx/8g5Vounxx6xW9w8sJPJ4uWse2wWF7b1sVpsenyN1eLyrjlsFl3XnrBa
 zPu7ltXi2AIxi2+n3zBaLNr6hd3i4Yc97BZHzrxgtrjUP5HJ4v+eHewWXzbeZHcQ9bh87SKz
 x5aVN5k8nvZvZffYOesuu8eCTaUem1Z1snlsXlLvsXPHZyaP9/uusnn0bVnF6HFwn6HH501y
 ATxRXDYpqTmZZalF+nYJXBkzXxxkL2gRqHh36TBTA+Nk3i5GDg4JAROJ21/suxg5OYQEdjNK
 NDxmBLElBCQlPjVPZYWwhSVW/nvODlHziVHiwnkREJtNQEPi+ortQHEuDhGBDiaJPVNPMoM4
 zAIbmSSOXdoM1iEs4CTx7NQ2ZhCbRUBV4sfFG2A2r4C1xOXN99ggNshLrN5wgHkCI88CRoZV
 jJKpBcW56bnJhgWGeanlesWJucWleel6yfm5mxjB8aClsYPx3bcm/UOMTByMhxglOJiVRHhf
 nzqeLsSbklhZlVqUH19UmpNafIhRmoNFSZx3pWFEupBAemJJanZqakFqEUyWiYNTqoEpoHCC
 ttuC1inW+vJHT15hdnzD0/jeamL8ktfhk5JzeBebJ594adLZ8OOA6/IUd91dJSm/WGSvXlFZ
 X+PE/9Gk4zDja7tzV9nyXgteuXiyq9HzXmuc8ucFvEcLbzWvvxHKcixb1e2r1+qN/zk/tH4W
 WHd5/qFdh69MPZAttyhphw37t2WBraf357Qwv3X9YPFiFqf8g6cee0RqOWUzK5bWddseZIvu
 Dy05No+J+bOFNpeK6imuOb8D9h/nEjC/YvtV8r/29qtPH2VEbW97dXtrTPihIqlXHRNlN755
 31nRncIXH75veqLB5f2rXzX9bp1dVxnf3z3p24rOlFNFSvr/127OUd2lcelzGqvR9q/JSizF
 GYmGWsxFxYkAIH1Iw/YCAAA=
X-CMS-MailID: 20250305091845epcas5p1689eda3ba03572377997897271636cfd
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250305091845epcas5p1689eda3ba03572377997897271636cfd
References: <CGME20250305091845epcas5p1689eda3ba03572377997897271636cfd@epcas5p1.samsung.com>
Cc: devicetree@vger.kernel.org, ravi.patel@samsung.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, swathi.ks@samsung.com,
 rmk+kernel@armlinux.org.uk, pankaj.dubey@samsung.com, gost.dev@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 0/2] net: stmmac: dwc-qos: Add FSD EQoS
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

Changes since v7:
1. Modified the example given in DT binding as per Russell's review
comment on setting clock tree in DT
2. Removed FSD probe since clock tree setting would be done via DT.

Here is the link to v7 patches for reference:
https://lore.kernel.org/netdev/20250220043712.31966-1-swathi.ks@samsung.com/

Swathi K S (2):
  dt-bindings: net: Add FSD EQoS device tree bindings
  net: stmmac: dwc-qos: Add FSD EQoS support

 .../devicetree/bindings/net/snps,dwmac.yaml   |   5 +-
 .../bindings/net/tesla,fsd-ethqos.yaml        | 118 ++++++++++++++++++
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        |   8 +-
 3 files changed, 128 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
