Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E80C7DF116
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Nov 2023 12:25:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9560C6B44F;
	Thu,  2 Nov 2023 11:25:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20092C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Nov 2023 11:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698924314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G9+EloQzdVYeoamONcM2Hc+44nMTwaQEa+a85PRBSe4=;
 b=LQdFt3ZKGdEApjSx/97bjMdIMNvO9Reubs6+q6d/ybk4JUSmqFjxmHQd9RS4HuhaZIHi7Q
 EBJP0G8XejMPD7A+oa0rFXD8arHVs0zCdgY8fsjK1q7ZG5JtxNldHwUDkL4DKTqmqOSZMf
 cB4Bp2eyoAGcRypkXsp01/OP4tmy4I0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127--pwpa8u0O7CAGG9s8M9AEg-1; Thu, 02 Nov 2023 07:25:12 -0400
X-MC-Unique: -pwpa8u0O7CAGG9s8M9AEg-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-66d3f71f49cso2471276d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Nov 2023 04:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698924312; x=1699529112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G9+EloQzdVYeoamONcM2Hc+44nMTwaQEa+a85PRBSe4=;
 b=GQzeRObPZIbtsE0aXjo2bvybGp8gx5l42a+GivNf4FSVHcym8CfrzYNwGTtbk2YwDy
 Td8DSQXAoTTiOelrpcpPbzWpbAgXJMcpbvhsTEuZ88jk7uJfS1vVFWTJYB1QpZZ3rGWE
 CxLfHyR7A8e0LlhjFOFyDyLLxdbacylCQNbIfduyfBKt5W1yvTJwzVGYueNDdYHLfAH0
 03khfLBD/eIxwy4PpLt2gvykuN3tQ1i3j71fq3Xkya/9NAOUSW5LXMbUrImwN2eNjc1u
 cAyveIJ3/bXK9OnBqd8fxZgWYlX2MUs46JDe0kjrW1iCcZ9RCNhlgjc3k3oBV0giJ1cY
 QgUA==
X-Gm-Message-State: AOJu0Yw1k6pakVosVF5havaKTruQZR2kB0eccy8oJp56B3jRDswMta/z
 jJ/rRwjf4nRkMs6ylHqUW7oI8/g36mzgvd6OZIr3x7i7bvGYI95Z8sOHL+CUsNqL3MDsIv5MHBs
 YvdR1n9ZbV5N/n11JIPEAfW4xTSNy+INusMAPax4g
X-Received: by 2002:a05:620a:24c3:b0:76f:27af:2797 with SMTP id
 m3-20020a05620a24c300b0076f27af2797mr21315839qkn.0.1698924312390; 
 Thu, 02 Nov 2023 04:25:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT5geDHIolp0aNPY1+MLsvDeWC3teHeCm8p/b1jYgutWDc0LnG9FJFSFJHpLLBT8Z59NWKDA==
X-Received: by 2002:a05:620a:24c3:b0:76f:27af:2797 with SMTP id
 m3-20020a05620a24c300b0076f27af2797mr21315813qkn.0.1698924311978; 
 Thu, 02 Nov 2023 04:25:11 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-226-153.dyn.eolo.it.
 [146.241.226.153]) by smtp.gmail.com with ESMTPSA id
 i7-20020a05620a144700b0075ca4cd03d4sm2228731qkl.64.2023.11.02.04.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 04:25:11 -0700 (PDT)
Message-ID: <5a265e5541ab1de2258a6e61bd672ef5fb6be65f.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Bernd Edlinger <bernd.edlinger@hotmail.de>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Thu, 02 Nov 2023 12:25:07 +0100
In-Reply-To: <AS8P193MB1285DECD77863E02EF45828BE4A1A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
References: <AS8P193MB1285DECD77863E02EF45828BE4A1A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Wait a bit for the reset to
	take effect
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

On Mon, 2023-10-30 at 07:01 +0100, Bernd Edlinger wrote:
> otherwise the synopsys_id value may be read out wrong,
> because the GMAC_VERSION register might still be in reset
> state, for at least 1 us after the reset is de-asserted.
> 
> Add a wait for 10 us before continuing to be on the safe side.

This looks like a bugfix: you should target explicitly the 'net' tree,
adding such tag into the subj. More importantly you should include a
suitable 'Fixes' tag.

Please send a new revision with the above changes. You can retain the
already collected reviewed tags.

Thanks,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
