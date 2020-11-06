Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6852A9944
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 17:17:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B82EC3FAD4;
	Fri,  6 Nov 2020 16:17:16 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB8B1C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 16:17:12 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id g19so1688001otp.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Nov 2020 08:17:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PHA0EidL03UfC8An9Xo/HRrV3J9easCIHZo3/RUQUy8=;
 b=KKbYOjKVnYUcT55PCcpGSuNY/L8qDOwCxnV4JhnA6FPIOeLmmVKKHYekDTlaKzFEUY
 d9ttFWumSgxXC0Qkywg3Tjfwa7ZxIKNL26cIcDiRl+j2DwU5nALSyayhtTxlqV92Mjk3
 oEdCeN+JJsjGoWi65St9TCCS2qJCUB1VKc+620ZQNnbPRoSEm0smkirETmG/bWK+/DyT
 KxXVlmyHs26T48JnQQtnlt5ij04ZaO9t6UoTThQmPbk3KEeZnYIjk0GOGkk21xg+8LXT
 HuXRQYL3THqy3LWSqsB8/nmqoh30fCjbqme/76o9+OqZWYlVDfbXFSrQpNkEmYoiw0lW
 MNJw==
X-Gm-Message-State: AOAM532n6LjqpQRft8Z0SZirHVjyywR8ulOfvHREIEQOowB8cXPsqE0f
 oMnPkDcFbRlUAX9xVFXBbQ==
X-Google-Smtp-Source: ABdhPJyUM2g1joTzdNeL4HLOcHzKbVxE71kOK6QziFU/66zPxzdPYxK0fs86RuyZf2tu+DP2kWBsow==
X-Received: by 2002:a05:6830:c4:: with SMTP id
 x4mr1618752oto.183.1604679431223; 
 Fri, 06 Nov 2020 08:17:11 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n128sm353087oif.4.2020.11.06.08.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 08:17:10 -0800 (PST)
Received: (nullmailer pid 3298198 invoked by uid 1000);
 Fri, 06 Nov 2020 16:17:09 -0000
Date: Fri, 6 Nov 2020 10:17:09 -0600
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20201106161709.GA3297832@bogus>
References: <20201106091854.14958-1-amelie.delaunay@st.com>
 <20201106091854.14958-3-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106091854.14958-3-amelie.delaunay@st.com>
Cc: devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Badhri Jagan Sridharan <badhri@google.com>, Rob Herring <robh+dt@kernel.org>,
 Jun Li <lijun.kernel@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/5] dt-bindings: usb: Add DT bindings
 for STUSB160x Type-C controller
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

On Fri, 06 Nov 2020 10:18:51 +0100, Amelie Delaunay wrote:
> Add binding documentation for the STMicroelectronics STUSB160x Type-C port
> controller.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  .../devicetree/bindings/usb/st,stusb160x.yaml | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/st,stusb160x.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/st,stusb160x.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/st,stusb160x.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/usb/st,stusb160x.yaml


See https://patchwork.ozlabs.org/patch/1395559

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
