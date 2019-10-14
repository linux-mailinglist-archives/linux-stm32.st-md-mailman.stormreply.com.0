Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA58D6842
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2019 19:19:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88557C36B0B;
	Mon, 14 Oct 2019 17:19:33 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D240C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 17:19:31 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id y39so14447787ota.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 10:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+uUeApNQ/RRi9uJOAghMByheAKVmX2xvxdgsFJpIgzI=;
 b=l0eZJESkadaTwmklIMmzKnR4Bl9Ze5V7WCZy+lwrnZcIg3lE1gGT8KcdZtLug5/Dt/
 NhtBHl1pfhVKi4TW7jesO9bWgdvJiCHHsWHQ04hjCVw/wpkMQbEgxqLw+fjHvAWxL8aK
 JMvMvjMYE9soJKYPxtk9EgQy76J/aHqEKsArMAIF/ML5eqIF9iPNezNkGdK02uT45JjI
 LMUVqD4NT6/XzW1kQCDIpjhRgQwrBDh3LPU33cg3SffwlO6KHR2aoJmXpKdqL8FAaZOx
 s4eaB9ykRYj3Rem3Sq6o+nnUOBFYfJT7kLYcNc3uu0QLY3i23C/h5/YouA9OrNdua/G5
 tBPw==
X-Gm-Message-State: APjAAAWnBx24kxMocxhPRJ2vVvnu5VGc33AFaHRU8ImfGAEXvsqJJlsT
 HFcfdfSeueDknodygrLOnwLfsM8=
X-Google-Smtp-Source: APXvYqwwc3TAele/wXkLIzld34hhRrtg4CXjhYEk7aGrc/Ao9TLXsgP0bWPSDHfDCTXjh05CVuGCDw==
X-Received: by 2002:a05:6830:1103:: with SMTP id
 w3mr25682147otq.312.1571073570114; 
 Mon, 14 Oct 2019 10:19:30 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v24sm5478615ote.23.2019.10.14.10.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 10:19:28 -0700 (PDT)
Date: Mon, 14 Oct 2019 12:19:27 -0500
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191014171927.GA9665@bogus>
References: <20191014092316.24337-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014092316.24337-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, tglx@linutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: timer: Convert stm32
 timer bindings to json-schema
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

On Mon, 14 Oct 2019 11:23:16 +0200, Benjamin Gaignard wrote:
> Convert the STM32 timer binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> changes in v3:
> - use (GPL-2.0-only OR BSD-2-Clause) license
> - fix identation
> - add additionalProperties: false
> 
>  .../devicetree/bindings/timer/st,stm32-timer.txt   | 22 ----------
>  .../devicetree/bindings/timer/st,stm32-timer.yaml  | 47 ++++++++++++++++++++++
>  2 files changed, 47 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/st,stm32-timer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/st,stm32-timer.yaml
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
