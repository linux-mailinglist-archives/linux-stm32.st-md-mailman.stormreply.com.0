Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E26A146B8A
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jan 2020 15:42:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAC72C36B0C;
	Thu, 23 Jan 2020 14:42:28 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3A55C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 14:42:26 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id r27so2909844otc.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 06:42:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VojjtS7akMpAwcay/UmymGiR2hr9tFaDHzEASOXUD8w=;
 b=uEqDdxc0N/3kKgD8nZyNoB4UPLElwtrN1baPj9kHS2BykeAIgTC0WbNS2ydd/HAYYC
 VnFmQp/sR0eBWGMyKYSAiQGq7/0sr9X2ybrosjoeF7Z4f6VLGO2U84+BJ5EJseHCbtjl
 ZtBtvQvHT4lyh2AEScKEJvoplP3C8/OQF7/l480/HIuo1mQn3G0B6/+9Bntl2D3KbIvu
 3I5FT+UQAcAet3NqJcdHWw8a31zot/kuE2Xb2LrT5ogxQQ6ofQEUb4qjNdpGyy+5hK78
 N7aOY7n/0XNcuCcfioLhZZ2wEJgW367/nIPAq6sysipuK+A4gSqnTDPkw9V7vmZGQ4X7
 /R2w==
X-Gm-Message-State: APjAAAUAeFx9bipMS14Ukcgdj+vVCY5vizXKUD/1fHsj7Uyobt8xcnlq
 I+SvGTFETt9ZriFnLxGYlQ==
X-Google-Smtp-Source: APXvYqxykG4E/5TrCk67dHt8GjjUfo7u0vBc/K5VrQHFHH+0sZpSZGqLdxDBl66PpWm84FUIUxD2uw==
X-Received: by 2002:a9d:3e16:: with SMTP id a22mr12080775otd.259.1579790545677; 
 Thu, 23 Jan 2020 06:42:25 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n16sm845782otk.25.2020.01.23.06.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 06:42:25 -0800 (PST)
Received: (nullmailer pid 9469 invoked by uid 1000);
 Thu, 23 Jan 2020 14:42:24 -0000
Date: Thu, 23 Jan 2020 08:42:24 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200123144224.GA9094@bogus>
References: <20200122095558.22553-1-benjamin.gaignard@st.com>
 <20200122095558.22553-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200122095558.22553-2-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, linux-serial@vger.kernel.org,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: serial: Convert rs485
 bindings to json-schema
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

On Wed, 22 Jan 2020 10:55:57 +0100, Benjamin Gaignard wrote:
> Convert rs485 binding to yaml style file.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 2:
> - remove types inside rs485-rts-delay property and add a maximum for delay
>   values
> 
>  Documentation/devicetree/bindings/serial/rs485.txt | 32 +--------------
>  .../devicetree/bindings/serial/rs485.yaml          | 45 ++++++++++++++++++++++
>  2 files changed, 46 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/serial/rs485.yaml
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
