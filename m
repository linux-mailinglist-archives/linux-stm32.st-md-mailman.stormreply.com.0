Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D08839D7852
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Nov 2024 22:27:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78BD6C71280;
	Sun, 24 Nov 2024 21:27:22 +0000 (UTC)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26305C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Nov 2024 21:27:15 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BA7F12008A6;
 Sun, 24 Nov 2024 22:27:14 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A3260200464;
 Sun, 24 Nov 2024 22:27:14 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com
 (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 5A97E203C1;
 Sun, 24 Nov 2024 22:27:13 +0100 (CET)
Date: Sun, 24 Nov 2024 22:27:14 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <Z0OaMjw0A4OadZfI@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com>
 <173203348678.1765163.1636321988738538785.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <173203348678.1765163.1636321988738538785.robh@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Andrew Lunn <andrew@lunn.ch>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v5 13/16] dt-bindings: net: Add DT
 bindings for DWMAC on NXP S32G/R SoCs
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

On Tue, Nov 19, 2024 at 10:24:46AM -0600, Rob Herring (Arm) wrote:
> 
> On Tue, 19 Nov 2024 16:00:19 +0100, Jan Petrous (OSS) wrote:
> > Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> > and S32R45 automotive series SoCs.
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 105 +++++++++++++++++++++
> >  .../devicetree/bindings/net/snps,dwmac.yaml        |   3 +
> >  2 files changed, 108 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> 

Thanks, I will fix it in v6.

> dtschema/dtc warnings/errors:
> 
> doc reference errors (make refcheckdocs):

I have also noticed the refcheckdocs errors, but AFAIK those are not
connected to my commit:

 $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-   refcheckdocs
 Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
 Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
 Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
 Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt: Documentation/devicetree/bindings/mfd/zii,rave-sp.txt
 Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
 Documentation/hwmon/g762.rst: Documentation/devicetree/bindings/hwmon/g762.txt
 Documentation/hwmon/isl28022.rst: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
 Documentation/translations/ja_JP/SubmittingPatches: linux-2.6.12-vanilla/Documentation/dontdiff
 Documentation/userspace-api/netlink/index.rst: Documentation/networking/netlink_spec/index.rst
 Documentation/userspace-api/netlink/specs.rst: Documentation/networking/netlink_spec/index.rst
 MAINTAINERS: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
 lib/Kconfig.debug: Documentation/dev-tools/fault-injection/fault-injection.rst

> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.

I have series based on v6.12 and I don't see there any v6.13-rc1.

> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

I rechecked with fixed indentation, no any error was found.

BR.
/Jan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
