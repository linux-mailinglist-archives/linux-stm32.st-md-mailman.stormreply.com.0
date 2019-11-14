Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AACFCD81
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2019 19:27:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D9AEC36B0B;
	Thu, 14 Nov 2019 18:27:45 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00B06C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 18:27:44 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id 22so6174329oip.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 10:27:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8He97cXELbuSFR63zDapnWyBHvhWcxQcIpiz/Ztauww=;
 b=epu1p9Gu5do3PwYVGs2ZgYTH3PcFL9AhEHJA08RLB5EIx5mHxW8+cnLUYQnh+nSwNC
 iH5g48EE5KKWXAodokFJw6J9aboX6l/mS4uYVYI3ZnlQYIo5mcm5uoA2d0FN4o0JJIi2
 IGNU8fTwsZYTPWEX5jVIkL/sxnsh1u2IKJQ2yUTdl5JLYp+kOzcD0CPszsnE4YIcMvZM
 M945XNVBKNFdYXyi7dgy0x6O3/DSe1iPGpZCp0drCEq4LZcIaDiERVoD4ZkZjlRDP4+L
 K2cx/AXJlG+hGVLC/VxYA824fY96+DyOafaTcXJRjJxk00vvjBiuQ2Q6GY5DhtnrWs0r
 5uRQ==
X-Gm-Message-State: APjAAAXblSfqJaFpZeNQjPEY+qJpBBipuF6pi0Y/ot2mb1YvaSCuApfD
 VMyXfnSktM320uBmV2TWEg==
X-Google-Smtp-Source: APXvYqzxQagjwTYvMPUFG0Oo9zNFaeioYxFRTV5TSy89ohIWgShYag+Hww7iOkylWMfxMjF0FwasPQ==
X-Received: by 2002:aca:cd02:: with SMTP id d2mr4814481oig.80.1573756062663;
 Thu, 14 Nov 2019 10:27:42 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 65sm2036620oie.50.2019.11.14.10.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 10:27:42 -0800 (PST)
Date: Thu, 14 Nov 2019 12:27:41 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191114182741.GA28603@bogus>
References: <20191108125244.23001-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108125244.23001-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 robh+dt@kernel.org, linux-crypto@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, herbert@gondor.apana.org.au
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: crypto: Convert stm32 CRC
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

On Fri, 8 Nov 2019 13:52:42 +0100, Benjamin Gaignard wrote:
> Convert the STM32 CRC binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/crypto/st,stm32-crc.txt    | 16 ---------
>  .../devicetree/bindings/crypto/st,stm32-crc.yaml   | 38 ++++++++++++++++++++++
>  2 files changed, 38 insertions(+), 16 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/crypto/st,stm32-crc.txt
>  create mode 100644 Documentation/devicetree/bindings/crypto/st,stm32-crc.yaml
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
