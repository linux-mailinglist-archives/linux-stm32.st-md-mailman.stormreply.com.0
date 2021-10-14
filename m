Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E894442E0F7
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Oct 2021 20:16:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C798C5C83E;
	Thu, 14 Oct 2021 18:16:33 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0861DC5C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 18:16:30 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 l16-20020a9d6a90000000b0054e7ab56f27so9347244otq.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 11:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q0HbPoa/SmLtlcbL4A98vA90nfo5N87+w7YnhWCZ1+o=;
 b=NTDZ21GKFc9WLN87AwQaHjGgoBeedCDNyMMnum5hGfPpk8qC7lIwGhByyB9X8L/fKx
 ol9ggSP4gZjQFn4fzVQL2VFDUtZqLHTaZmWVw44qqfHoAzUC6ystRGJ29pZFbvm1NFl4
 lRmvPXQVXFxEZeuZWF737pJ0OHxmnb83Qkts90WcJPBFfA/NB3OJv+HCzEzu+XSAqm7k
 sBAOmZgoeohDLr37N+L7OQ/qUx6enEgehEnuVrFlZdYXET4hplUEs+NzCSgJZWt83rs1
 4YhXJZN1kY7TgEs9hEMUoZ5r1p8Z6PeyRd+EW7W1oLnHJ4xYkxma3aV/YwnCsCcEKfV/
 ZZ6A==
X-Gm-Message-State: AOAM530bWvmtnudBmYXnplOSts2CUE1uBqwp4BGSSR90O9wcUcr8DmZY
 kS8QtAN4tnoYPETFRv+Q0Q==
X-Google-Smtp-Source: ABdhPJxKfM3iXQ0zI911tswBcyLS7YVr4ZTJq7hvniXYOhLyYuHoLue+Q56bsDP/2yc8QCkCgynuuA==
X-Received: by 2002:a05:6830:4487:: with SMTP id
 r7mr657269otv.251.1634235389846; 
 Thu, 14 Oct 2021 11:16:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f1sm553273oos.46.2021.10.14.11.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 11:16:29 -0700 (PDT)
Received: (nullmailer pid 3663089 invoked by uid 1000);
 Thu, 14 Oct 2021 18:16:28 -0000
Date: Thu, 14 Oct 2021 13:16:28 -0500
From: Rob Herring <robh@kernel.org>
To: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Message-ID: <YWhz/AsfDX24iUR3@robh.at.kernel.org>
References: <20211005152453.89330-1-amelie.delaunay@foss.st.com>
 <20211005152453.89330-3-amelie.delaunay@foss.st.com>
 <1633473959.465401.106809.nullmailer@robh.at.kernel.org>
 <491ab475-e7dc-eb71-85aa-6d82543b74db@foss.st.com>
 <CAL_JsqLEPd9_4SgmDh8GakyNxQeuMKhJeGzaLbZSdxDJ_-dZYg@mail.gmail.com>
 <2a07f03d-ffaa-77f6-c223-74bae60eb3f1@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a07f03d-ffaa-77f6-c223-74bae60eb3f1@foss.st.com>
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-phy@lists.infradead.org,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/3] dt-bindings: phy:
 phy-stm32-usbphyc: add optional phy tuning properties
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

On Wed, Oct 06, 2021 at 02:58:21PM +0200, Amelie DELAUNAY wrote:
> 
> 
> On 10/6/21 2:38 PM, Rob Herring wrote:
> > > Disable child nodes while parent node is already disabled fixes the
> > > warning. But it means to add status = "okay"; in child nodes everywhere
> > > usbphyc is enabled.
> > Presumably, you already have to add phy-supply everywhere.
> >  >> Is it normal dtbs_check checks in child nodes when parent node is
> disabled?
> > I'll look into doing that.
> 
> Should I wait for your potential dtbs_check update or should I disable child
> nodes in .dtsi (and enable them along with parent node in .dts using
> usbphyc) ?

I pushed a fix to dt-validate for this.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
