Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CB96B852A
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 23:51:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD9E9C6A60F;
	Mon, 13 Mar 2023 22:51:17 +0000 (UTC)
Received: from post.baikalelectronics.com (post.baikalelectronics.com
 [213.79.110.86])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EF62C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 22:51:16 +0000 (UTC)
Received: from post.baikalelectronics.com (localhost.localdomain [127.0.0.1])
 by post.baikalelectronics.com (Proxmox) with ESMTP id 0903DE0EB7;
 Tue, 14 Mar 2023 01:51:16 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 baikalelectronics.ru; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:from:from:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=post;
 bh=oyRmDVoN+2lAomqaOYUxFd6Rs2QRCU3KaCv853AjErI=; b=iNRjn9CHeGAW
 ovD3bq746Zx0qmkDhXjwwClvb6q8j+ts/mn6WBauv2l4//vaxR8YwoXDnoqYDsM/
 kWLtXoKfBn0fZfJXfzzjY0A34xL9wCEV7bGpCavA6gXGsyXh91rOGpHB/Y+NmZcA
 Wmh0L1vlts+pO3pgU4LkvFBZgxUFFIk=
Received: from mail.baikal.int (mail.baikal.int [192.168.51.25])
 by post.baikalelectronics.com (Proxmox) with ESMTP id D28EDE0E6A;
 Tue, 14 Mar 2023 01:51:15 +0300 (MSK)
Received: from localhost (10.8.30.10) by mail (192.168.51.25) with Microsoft
 SMTP Server (TLS) id 15.0.1395.4; Tue, 14 Mar 2023 01:51:15 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Tue, 14 Mar 2023 01:50:53 +0300
Message-ID: <20230313225103.30512-7-Sergey.Semin@baikalelectronics.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-Originating-IP: [10.8.30.10]
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 06/16] dt-bindings: net: dwmac:
	Elaborate stmmaceth/pclk clocks description
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

Current clocks description doesn't provide a comprehensive notion about
what "stmmaceth" and "pclk" actually represent from the IP-core manual
point of view. The bindings file states:
stmmaceth - "GMAC main clock",
apb - "Peripheral registers interface clock".
It isn't that easy to understand what they actually mean especially seeing
the DW *MAC manual operates with clock definitions like Application,
System, Host, CSR, Transmit, Receive, etc clocks. Moreover the clocks
usage in the driver doesn't shade a full light on their essence. What
inferred from there is that the "stmmaceth" name has been assigned to the
common clock, which feeds both system and CSR interfaces. But what about
"apb"? The bindings defines it as the clock for "peripheral registers
interface". So it's close to the CSR clock in the IP-core manual notation.
If so then when "apb" clock is specified aside with the "stmmaceth", it
represents a case when the DW *MAC is synthesized with CSR_SLV_CLK=y
(separate system and CSR clocks). But even though the "apb" clock is
requested in the MAC driver, the driver doesn't actually use it as a
separate CSR clock where the IP-core manual requires. All of that makes me
thinking that the case of separate system and CSR clocks isn't correctly
implemented in the driver.

Let's start with elaborating the clocks description so anyone reading
the DW *MAC bindings file would understand that "stmmaceth" is the
system clock and "pclk" is actually the CSR clock. Indeed in accordance
with sheets depicted in [1]:
system/application clock can be either of: hclk_i, aclk_i, clk_app_i;
CSR clock can be either of: hclk_i, aclk_i, clk_app_i, clk_csr_i.
(Similar definitions present in the others IP-core manuals.) So the CSR
clock can be tied to the application clock considering the later as the
main clock, but not the other way around. In case if there is only
"stmmaceth" clock specified in a DT node, then it will be considered as a
source of clock signal for both application and CSR. But if "pclk" is also
specified in the list of the device clocks, then it will be perceived as
the separate CSR clock.

[1] DesignWare Cores Ethernet MAC Universal Databook, Revision 3.73a,
    October 2013, p. 564.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/net/snps,dwmac.yaml          | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index edef405766e4..3e3fbc1dfafa 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -37,8 +37,16 @@ properties:
     maxItems: 8
     additionalItems: true
     items:
-      - description: GMAC main clock
-      - description: Peripheral registers interface clock
+      - description:
+          GMAC main clock, also called as system/application clock.
+          This clock is used to provide a periodic signal for the DMA/MTL
+          interface and optionally for CSR, if the later isn't separately
+          clocked.
+      - description:
+          Peripheral registers interface clock, also called as CSR clock.
+          MCI, CSR and SMA interfaces run on this clock. If it's omitted,
+          the CSR interfaces are considered as synchronous to the system
+          clock domain.
       - description:
           PTP reference clock. This clock is used for programming the
           Timestamp Addend Register. If not passed then the system
-- 
2.39.2


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
