Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDE7199C0F
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 18:49:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F861C36B0B;
	Tue, 31 Mar 2020 16:49:41 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CF47C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 16:49:40 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id k9so22483536iov.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 09:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3QwrQutvISOdwRt5xFRlvMoy4S4i7e5APKKFlmWfPlI=;
 b=UmaEVWE9VU/lqyvmR6qbt51ZYkKdtlzKSRwRyuWlspN0UFNuipoxs8nw3swqtg6hd3
 bvJXJ0H7SRfQzBv5zuDbV3lAzOl3diDUsgPmHvsWPqHZx3XqNFmC5CYFHUt3R+OAzWYn
 phjWRJ2uT3IFePHaoHu8wbwSzf99qamramzEbGM8fXRSmEFG3MLlm92fZ/fmmd98XEnT
 IHsjH0NHMadBJr+p+egJSbyfyzDG8zAK3YmWag2xy1LjDrP+pgIebjt8yv4qLD/CDgR2
 yKzzjzubnQnuKB1Cj/RGC/wbFpduA5H2p+exgUEQjrmy4yj4dfpS8UFaY7E3luJLtpM3
 UvaQ==
X-Gm-Message-State: ANhLgQ3aRyc82chPA5kx+rsRUMx6C+jueA2lguL4wvo3fNsiL1OISxnG
 pdFVTwF5V38rMlhpJiT0Lw==
X-Google-Smtp-Source: ADFU+vu0uvJu27akUkqWds8x0YrvgBWePU3mk/Nwbnw0BEYSzZyw5fX/kIW3WxqJWs3yGGKUbPvnEA==
X-Received: by 2002:a02:5a82:: with SMTP id v124mr8013603jaa.132.1585673378445; 
 Tue, 31 Mar 2020 09:49:38 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id l17sm6133742ilf.28.2020.03.31.09.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 09:49:37 -0700 (PDT)
Received: (nullmailer pid 20383 invoked by uid 1000);
 Tue, 31 Mar 2020 16:49:36 -0000
Date: Tue, 31 Mar 2020 10:49:36 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200331164936.GA18783@bogus>
References: <20200331083146.10462-1-benjamin.gaignard@st.com>
 <20200331083146.10462-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331083146.10462-2-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, tglx@linutronix.de,
 fabrice.gasnier@st.com, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 1/6] dt-bindings: mfd: Document STM32
 low power timer bindings
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

On Tue, Mar 31, 2020 at 10:31:41AM +0200, Benjamin Gaignard wrote:
> Add a subnode to STM low power timer bindings to support timer driver
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 5:
> - the previous has been acked-by Rob but since I have docummented
>   interrupts and interrupt-names properties I haven't applied it here.
> 
> version 4:
> - change compatible and subnode names
> - document wakeup-source property
> 
>  .../devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
