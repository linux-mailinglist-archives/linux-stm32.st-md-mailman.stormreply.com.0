Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCZ/DiWLcGkEYQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 09:15:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8723C5358E
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 09:15:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2ED72C36B3C;
	Wed, 21 Jan 2026 08:15:32 +0000 (UTC)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62FCCC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 08:15:31 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C18021A0D7D;
 Wed, 21 Jan 2026 09:15:30 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A994F1A0D78;
 Wed, 21 Jan 2026 09:15:30 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com
 (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 15432202C4;
 Wed, 21 Jan 2026 09:15:30 +0100 (CET)
Date: Wed, 21 Jan 2026 09:15:30 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <aXCLIjrGfLVGv+Si@lsv051416.swis.nl-cdc01.nxp.com>
References: <20251214-dwmac_multi_irq-v1-0-36562ab0e9f7@oss.nxp.com>
 <20251214-dwmac_multi_irq-v1-2-36562ab0e9f7@oss.nxp.com>
 <176582217911.3066791.4926710165988218857.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <176582217911.3066791.4926710165988218857.robh@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
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
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,google.com,oss.nxp.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,redhat.com,vger.kernel.org,pengutronix.de,lists.infradead.org,suse.com,lunn.ch,davemloft.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:imx@lists.linux.dev,m:s32@nxp.com,m:edumazet@google.com,m:ghennadi.procopciuc@oss.nxp.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:kernel@pengutronix.de,m:s.hauer@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jan.petrous@oss.nxp.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jan.petrous@oss.nxp.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,devicetree.org:url,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,lsv051416.swis.nl-cdc01.nxp.com:mid]
X-Rspamd-Queue-Id: 8723C5358E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Dec 15, 2025 at 12:09:39PM -0600, Rob Herring (Arm) wrote:
> 
> On Sun, 14 Dec 2025 23:15:38 +0100, Jan Petrous (OSS) wrote:
> > The DWMAC IP on supported SoCs has connected queue-based IRQ lines.
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 40 +++++++++++++++++++---
> >  1 file changed, 36 insertions(+), 4 deletions(-)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: ignoring, error in schema: properties: interrupt-names
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: properties:interrupt-names: [{'items': [{'const': 'macirq'}, {'const': 'rx-queue-0'}, {'const': 'tx-queue-0'}, {'const': 'rx-queue-1'}, {'const': 'tx-queue-1'}, {'const': 'rx-queue-2'}, {'const': 'tx-queue-2'}, {'const': 'rx-queue-3'}, {'const': 'tx-queue-3'}, {'const': 'rx-queue-4'}, {'const': 'tx-queue-4'}]}] is not of type 'object', 'boolean'
> Traceback (most recent call last):
>   File "/usr/local/bin/dt-doc-validate", line 8, in <module>
>     sys.exit(main())
>              ~~~~^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 66, in main
>     ret |= check_doc(f)
>            ~~~~~~~~~^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 37, in check_doc
>     dtsch.check_schema_refs()
>     ~~~~~~~~~~~~~~~~~~~~~~~^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 241, in check_schema_refs
>     self._check_schema_refs(resolver, self)
>     ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 212, in _check_schema_refs
>     self._check_schema_refs(resolver, v, parent=k, is_common=is_common,
>     ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                             has_constraint=has_constraint)
>                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 216, in _check_schema_refs
>     self._check_schema_refs(resolver, schema[i], parent=parent, is_common=is_common,
>     ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                             has_constraint=has_constraint)
>                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 203, in _check_schema_refs
>     ref_sch = resolver.lookup(schema['$ref']).contents
>               ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 682, in lookup
>     retrieved = self._registry.get_or_retrieve(uri)
>   File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 422, in get_or_retrieve
>     registry = self.crawl()
>   File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 500, in crawl
>     id = resource.id()
>   File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 231, in id
>     id = self._specification.id_of(self.contents)
>   File "/usr/local/lib/python3.13/dist-packages/referencing/jsonschema.py", line 50, in _dollar_id
>     return contents.get("$id")
>            ^^^^^^^^^^^^
> AttributeError: 'list' object has no attribute 'get'
> Lexical error: Documentation/devicetree/bindings/net/nxp,s32-dwmac.example.dts:58.13-17 Unexpected 'snps'
> Error: Documentation/devicetree/bindings/net/nxp,s32-dwmac.example.dts:58.13-17 syntax error
> FATAL ERROR: Unable to parse input tree
> make[2]: *** [scripts/Makefile.dtbs:141: Documentation/devicetree/bindings/net/nxp,s32-dwmac.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1559: dt_binding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20251214-dwmac_multi_irq-v1-2-36562ab0e9f7@oss.nxp.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
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

It was missing closing semicolon in the example. Thanks for catch.
Fixed in v2.

/Jan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
