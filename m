Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK/gF3Kuu2k8mgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 09:06:10 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C4F2C7A31
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 09:06:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 757CEC87ED3;
	Thu, 19 Mar 2026 08:06:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1D8DC87ED2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 08:06:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 40C3E41AF0;
 Thu, 19 Mar 2026 08:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD00C19424;
 Thu, 19 Mar 2026 08:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773907566;
 bh=4JCWNF+D/qWHcNu86lWPqI3P/Ks4jxVkRRfjXis1WB8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hPJywGWmfPZKo4esFCd879TXQJvbVAD2piXfU4mtgyq9Zd4VcIigyHRLZaniM+AT1
 DDSGrTb18/IGjBT2vl9PL7tjXDWVt8mZB/W/zHqEveP77YHO3N+8XLAZili5hOhvRD
 3Ep0CcTceZNeof0PKKDgqBl8VnpubVB3H3OCk9U7yI0OGVEMkv9tv6vTqeoYfyPHsX
 awSjW9RNWaf9p2Cpza8WkNWThQu7XNSh3q6d4yYYICM869q/XOTWD9c9JrKurNK98k
 VtILAttqv7Ww0SGR27d1IAjLYU41dnH6K9J+dNZ2joj2RY/dPzSvL1jePwpNgCbpnc
 ijcCCxdNNy1EQ==
Date: Thu, 19 Mar 2026 09:06:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20260319-glistening-ultramarine-ibis-1eb3d6@quoll>
References: <20260317180329.1207625-1-arnaud.pouliquen@foss.st.com>
 <20260317180329.1207625-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260317180329.1207625-3-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, op-tee@lists.trustedfirmware.org,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v21 2/6] dt-bindings: remoteproc: Add
 STM32 TEE-controlled rproc binding
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:arnaud.pouliquen@foss.st.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:op-tee@lists.trustedfirmware.org,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh+dt@kernel.org,m:sumit.garg@kernel.org,m:krzk+dt@kernel.org,m:jens.wiklander@linaro.org,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:robh@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.449];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,devicetree.org:url,stormreply.com:email,stormreply.com:url,st.com:email]
X-Rspamd-Queue-Id: F0C4F2C7A31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 07:03:23PM +0100, Arnaud Pouliquen wrote:
> Add a Device Tree binding for the STM32 remote processor controlled
> via a Trusted Application running in OP-TEE.
> This binding describes the interface and properties required for STM32MP
> remoteproc instances managed by the TEE rproc service, including a
> linkage to the TEE backend through the property "rproc-tee-phandle".
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> V21 updates:
> - the m4 node is no more declared as a child of the optee-rproc node
> - "rproc-tee-phandle" property is introduced to reference the optee-rproc
> ---
>  .../remoteproc/st,stm32-rproc-tee.yaml        | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml
> new file mode 100644
> index 000000000000..ca4dd1c8e7b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/st,stm32-rproc-tee.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 remote processor controlled via TEE
> +
> +maintainers:
> +  - Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> +
> +description: |
> +  STM32MP remote processor controlled by a Trusted Application
> +  running in OP-TEE. This node is a child of the TEE remoteproc service
> +  (UUID 80a4c275-0a47-4905-8285-1486a9771a08) and exposes a remoteproc
> +  instance managed by the Linux remoteproc core via the TEE rproc service.
> +
> +  Firmware loading, authentication and remote processor start/stop are managed
> +  by the TEE application. The STM32-specific driver handles platform resources
> +  such as the mailboxes and reserved-memory.
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp1-m4-tee

Drop "tee", it suggests that compatible is tied to implementation of FW
you put there.

> +
> +  reg:
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      Remote processor identifier used by the TEE service. The <0> value
> +      in the example denotes a single instance with ID 0.
> +    maxItems: 1
> +
> +  mboxes:
> +    description: |
> +      Mailbox channels used for rpmsg/virtio functionality and processor
> +      shutdown.
> +    maxItems: 3
> +
> +  mbox-names:
> +    items:
> +      - const: vq0
> +      - const: vq1
> +      - const: shutdown
> +
> +  memory-region:
> +    description: |
> +      List of phandles to reserved-memory nodes describing the memory layout
> +      for the interprocessors communication.

Drop description. You miss maxItems, though.

> +
> +  interrupts:
> +    description: |

Same comments...

> +      Optional watchdog / status interrupt line used to detect crashes
> +      and optionally wake up the system.
> +    maxItems: 1
> +
> +  st,auto-boot:
> +    type: boolean
> +    description: |
> +      If present, the remote processor will be automatically started by
> +      the remoteproc core at boot.

That's policy, not DT property.

> +
> +  wakeup-source:
> +    type: boolean
> +    description: |
> +      Indicates that the watchdog interrupt can be used as a wakeup source.
> +
> +  rproc-tee-phandle:

Missing vendor prefix, drop phandle. You do not say that "st,auto-boot"
is "st,auto-boot-boolean"

> +    description: |
> +      Phandle to the remote processor backend node and its identifier. This property
> +      is used to link the TEE remoteproc service to the remote processor instance
> +      it controls. The value is a phandle reference to the remote processor node,
> +      followed by a cell specifying the remote processor identifier used by the TEE.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Missing constraints.

I also do not understand which bus node this is being child, if not
remote proc.

> +
> +required:
> +  - compatible
> +  - reg
> +  - rproc-tee-phandle
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    firmware {
> +        tee_rproc: optee-rproc {
> +            compatible = "80a4c275-0a47-4905-8285-1486a9771a08";
> +        };
> +    };

Drop

> +
> +    m4: m4@0 {

Drop unused label.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

e.g. mcu, because m4 feels like given model (Cortex M4?).

> +      compatible = "st,stm32mp1-m4-tee";
> +      reg = <0 0>;
> +
> +      mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
> +      mbox-names = "vq0", "vq1", "shutdown";
> +
> +      memory-region = <&vdev0vring0>, <&m_ipc_shm>, <&mcuram2>,
> +                      <&vdev0vring1>, <&vdev0buffer>, <&retram>;
> +
> +      interrupt-parent = <&exti>;
> +      interrupts = <68 1>;
> +
> +      rproc-tee-phandle = <&tee_rproc 0>;
> +      st,auto-boot;
> +      wakeup-source;
> +
> +      status = "okay";

Drop

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
