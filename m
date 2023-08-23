Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5277854C3
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Aug 2023 12:00:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B41D1C6B44C;
	Wed, 23 Aug 2023 10:00:14 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEA3FC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 10:00:13 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-4fe8c16c1b4so8279109e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 03:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692784813; x=1693389613;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F7VHCNyxaZNPU4FyyEuB/AUclDUQkc0xiHJpU5W0gcM=;
 b=DdRC64F7TsIqvpbURAmjmkXHNfUOXPKAzFNkwftE/JYO2mn6+EIJz4h5vUusHNSInk
 ihpZMYIoHmNcIqvOfo/aA45XdLGOqKyLDFidZEUGAFYVndU+OgexWr0XhjDbiJyaoe3e
 d2rTeB64fxD21JyVBvxGgckJv7UYM3mool0AbfUxhdmTYaAxf0CEsbt703bUf3/9ylLS
 vM1O5Io6v5Phkat83ZapzexKAzZ6tOwiIkS+8f/Vm+Exxs3TY5OkLYAv3oFKbiHQkqTZ
 wL6jkqX6n/2lqsov5XOl0atK2yo2Z5k3wdeSFrAIr5k7P8hw8rEcQiJkg0tm8+CWus5Y
 Fu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692784813; x=1693389613;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F7VHCNyxaZNPU4FyyEuB/AUclDUQkc0xiHJpU5W0gcM=;
 b=iI1jzwE7CRjegRwminQhxh3yGulv6tPCQ/V3LrJZxOV82lDue5ZX5lm/39fu3KzqKK
 V+TfYU/LM8DurAgVVByn+FJHbDGgDnrPlnYhtRHYb4lveJ1qgAs33kSH+L9ThDiAZe1r
 VyDxmAlxdjS9ZD+21JXEMY0IaiwNa8V6vIXOwKYY0vYcYz83n9ZgJ/hCzUsCmVv4A5kj
 09ItYYkdEVciGNKtHli3gpMxFv+OttT2ASHgv94Q5TdoXgaMKJPwmBY7EEVWO12qr57X
 FPFyT+79PNrSWuz3M5VYRYaY0TpThdiiYZP9ALNI1BPVwEaOzHR7iIBDnwVfoj5RQa0O
 jwSg==
X-Gm-Message-State: AOJu0YwNhU2s/CJ++cal7bqMuyaosfyioxKBzCcK4vx2bGUADx2y9IXW
 ceOpW/wQgAXl3sgJibLbYIk=
X-Google-Smtp-Source: AGHT+IFWKdHrFCphsDQXjanEbkwZOxjJGhc6zJjHuGkpv8q/4gqZ5pti/2VT7HTAMlTRGfXSuLIDJA==
X-Received: by 2002:a19:7617:0:b0:4fd:f77d:5051 with SMTP id
 c23-20020a197617000000b004fdf77d5051mr7774975lff.26.1692784812522; 
 Wed, 23 Aug 2023 03:00:12 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 c26-20020ac244ba000000b004f61187363asm2603076lfm.66.2023.08.23.03.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 03:00:12 -0700 (PDT)
Date: Wed, 23 Aug 2023 13:00:09 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <l7yajzhpuotn62pjkxk43qtcn3u4zltpyqcvo224737bjg3eab@bzu6pirxbvh2>
References: <20230819023132.23082-1-rohan.g.thomas@intel.com>
 <20230819023132.23082-2-rohan.g.thomas@intel.com>
 <20230822171525.692bd2df@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230822171525.692bd2df@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Rohan G Thomas <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 1/2] dt-bindings: net: snps,
 dwmac: Tx queues with coe
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

On Tue, Aug 22, 2023 at 05:15:25PM -0700, Jakub Kicinski wrote:
> On Sat, 19 Aug 2023 10:31:31 +0800 Rohan G Thomas wrote:
> > +      snps,tx-queues-with-coe:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: number of TX queues that support TX checksum offloading
> 

> Is it going to be obvious that if not present all queues support
> checksum offload? I think we should document the default.

This question is debatable:
1. By default the DW xGMAC and DW QoS Eth IP-cores are
synthesized with only the very first Tx queue having Tx COE enabled.
2. If TSO is disabled then the Tx COE can be individually enabled
for each queue available on DW QoS Eth controller and for the very
first N queues on DW xGMAC controller.
3. If TSO is enabled then the Tx COE will be automatically and always
enabled for as many first queues as there are TSO-capable
DMA-channels.
4. At the current state the STMMAC driver assumes that all Tx Queues
support Tx COE.

The entry 4 can't be changed since we'll risk to catch regressions on
the platforms with no property specified. On the other hand it partly
contradicts to the rest of the entries. I don't know what would be a
correct way to specify the default value in this case. Most likely
just keep the entry 4 and be done with it.

BTW I just noticed that but the suggested "snps,tx-queues-with-coe"
property semantic will only cover a DW XGMAC-part of the case 2. DW
QoS Eth can be synthesized with Tx COE individually enabled for a
particular queue if TSO is unavailable.

-Serge(y)

> -- 
> pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
