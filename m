Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 755BFCBF5B3
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Dec 2025 19:09:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E701C35E3C;
	Mon, 15 Dec 2025 18:09:44 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1CE7C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 18:09:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9FA9D60133;
 Mon, 15 Dec 2025 18:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15912C4CEF5;
 Mon, 15 Dec 2025 18:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765822181;
 bh=sJ0PanZdlGRt6sE05Z//hl9xXWQ8gP2sHeCPp+9cNxU=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=mzOopvwPU06fZET1fGgc81omur+ilBqKE/gwOHBKK2/m+tqXHJ/fPogQbHHDBSDqY
 k2I2Gk2eZKPb1QMeM/woGiSgPimAA7KT7pBj1ODgKIAB4CO6nEvrnxaqvzkoSPHnDg
 WaXrXRxMt+JZgW5547zfjtIGTvFlewpbxg9Jzrael5Utudzwg7f4tDGt9mzN+9jEqC
 c6ehZ1pN+53tCpdcipvNKNAdAc9Kn39/ttnjctzlnw2qhj0qsEDieOk3TqAb2F0zLR
 f4vTiDRuzKardG6Bg3z+IoVlHpmaIFtUSeh6ZmhQe5fSgcyjeWmVI9L1MDjvJB/lEp
 3Ok0ToWxDdbWQ==
Date: Mon, 15 Dec 2025 12:09:39 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
In-Reply-To: <20251214-dwmac_multi_irq-v1-2-36562ab0e9f7@oss.nxp.com>
References: <20251214-dwmac_multi_irq-v1-0-36562ab0e9f7@oss.nxp.com>
 <20251214-dwmac_multi_irq-v1-2-36562ab0e9f7@oss.nxp.com>
Message-Id: <176582217911.3066791.4926710165988218857.robh@kernel.org>
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Eric Dumazet <edumazet@google.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH RFC 2/4] dt-bindings: net: nxp,
 s32-dwmac: Declare per-queue interrupts
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


On Sun, 14 Dec 2025 23:15:38 +0100, Jan Petrous (OSS) wrote:
> The DWMAC IP on supported SoCs has connected queue-based IRQ lines.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 40 +++++++++++++++++++---
>  1 file changed, 36 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: ignoring, error in schema: properties: interrupt-names
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 8, in <module>
    sys.exit(main())
             ~~~~^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 66, in main
    ret |= check_doc(f)
           ~~~~~~~~~^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 37, in check_doc
    dtsch.check_schema_refs()
    ~~~~~~~~~~~~~~~~~~~~~~~^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 241, in check_schema_refs
    self._check_schema_refs(resolver, self)
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 212, in _check_schema_refs
    self._check_schema_refs(resolver, v, parent=k, is_common=is_common,
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                            has_constraint=has_constraint)
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 216, in _check_schema_refs
    self._check_schema_refs(resolver, schema[i], parent=parent, is_common=is_common,
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                            has_constraint=has_constraint)
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 203, in _check_schema_refs
    ref_sch = resolver.lookup(schema['$ref']).contents
              ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 682, in lookup
    retrieved = self._registry.get_or_retrieve(uri)
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 422, in get_or_retrieve
    registry = self.crawl()
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 500, in crawl
    id = resource.id()
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 231, in id
    id = self._specification.id_of(self.contents)
  File "/usr/local/lib/python3.13/dist-packages/referencing/jsonschema.py", line 50, in _dollar_id
    return contents.get("$id")
           ^^^^^^^^^^^^
AttributeError: 'list' object has no attribute 'get'
Lexical error: Documentation/devicetree/bindings/net/nxp,s32-dwmac.example.dts:58.13-17 Unexpected 'snps'
Error: Documentation/devicetree/bindings/net/nxp,s32-dwmac.example.dts:58.13-17 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:141: Documentation/devicetree/bindings/net/nxp,s32-dwmac.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1559: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251214-dwmac_multi_irq-v1-2-36562ab0e9f7@oss.nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
