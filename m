Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFNpGbaUpGmxkwUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 20:34:14 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C951D159F
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 20:34:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A8D8C030D6;
	Sun,  1 Mar 2026 19:34:13 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29F6BC2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 19:34:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 13AD760008;
 Sun,  1 Mar 2026 19:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D72C2BC86;
 Sun,  1 Mar 2026 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772393650;
 bh=7rbVOD75vPzOlqdIY0xNu9uaaRvyRGffFSeHa031auU=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=qVPauTa9GxT9y6KpV/kICjl+slqdqbPZ8z6sTszN2ExQwwLOSMFkdXAEkRrcMk5v+
 qlBiyS7UUMcdBCqjM0hdH1czuXF+PC2BkXKMrXoGcfTgeTppbgdT2qNWKn+hThkZLI
 0aU0xSo5SL3TxiyiuO2aUJXC0dMkhQA2nHUpxULIXqvRdQJW8GoJHklahpKIxElcXs
 mg5QoJeyGrq237T9nfFEaGg+/rjNKy4ePKPIacVuU7L9PB9i7OGHL6Xov5W4FnAwvD
 iupM/vdrhb16pAF+U5s6lmoOZCUyz8V/A1Z+mz9SsYHTZSC9aMfk2NokYN1c3GPz8e
 kgfpfmXa8QeVw==
Date: Sun, 01 Mar 2026 13:34:09 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
In-Reply-To: <20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz>
Message-Id: <177239364971.730877.1130326937114423321.robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Petr Hodina <petr.hodina@protonmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, phone-devel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 08/10] dt-bindings: input: touchscreen: st,
 stmfts: Introduce STM FTS5
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:rydberg@bitmath.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:petr.hodina@protonmail.com,m:mcoquelin.stm32@gmail.com,m:linux-input@vger.kernel.org,m:krzk+dt@kernel.org,m:phone-devel@vger.kernel.org,m:konradybcio@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,bitmath.org,protonmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F1C951D159F
X-Rspamd-Action: no action


On Sun, 01 Mar 2026 18:51:22 +0100, David Heidelberg wrote:
> Introduce more recent STM FTS5 touchscreen support.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/input/touchscreen/st,stmfts.yaml           | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml:58:1: [error] duplication of key "allOf" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml:58:1: found duplicate key "allOf" with value "[]" (original value: "[]")
make[2]: *** Deleting file 'Documentation/devicetree/bindings/input/touchscreen/st,stmfts.example.dts'
Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml:58:1: found duplicate key "allOf" with value "[]" (original value: "[]")
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/input/touchscreen/st,stmfts.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1597: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz

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
