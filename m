Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D2B5BEE5F
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Sep 2022 22:22:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69070C640F2;
	Tue, 20 Sep 2022 20:22:10 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D82FC62D6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Sep 2022 20:22:08 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 i15-20020a17090a4b8f00b0020073b4ac27so3580171pjh.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Sep 2022 13:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=bGCncq3RHnXTtj1/0wlo3cB68LXYXyEGO3jjPGrDch8=;
 b=TBcC7sVEgt3qsGmscAeGr/3j9DOyKu+UvlvZ0i5Oveqbb7WoOmkbsyCahyAcaJ46B9
 3airP52pxLsRuA8Zek5NXLNEhZHCK0gy5FPFWb4LZ9eQ1h11yMt+qiDmh2vdlTwJdVFe
 xKsY5DJRrCGIUE82HAkOD8Iw4hz7xeCUgflL7rS2TNqi+BmhZxkwHkwO4P3WXD0izerZ
 638x2WpzvyO0m20gKOx0LysHvBwMw4jjc7ABalTV0cQSgLxp1hFbsOOgLxbUpA1xbc1b
 PWL4a0LdqHIHwRvIq1R/DlsdJWvALHb0BJFNVy+6lVGYTuz1EeCbxoYGNUVuoWQpY+ud
 v8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=bGCncq3RHnXTtj1/0wlo3cB68LXYXyEGO3jjPGrDch8=;
 b=xwxPVV2Hhl2NGJk+dmJ//Aes7Xog7Fw4uLg2KKa+JiCFXb4/a/GYP+7nAh5JoA+qD4
 P9XxQjLUuJaXazCONW98ZhOUPYCv7w+ll70nTnUJMa3/KGHn8Dkic4pIYxsmEFpLFmr4
 svB6J4uOT8FcuCWVleAmqSrD9le33a7z/w855Aak/e+LIHQRvbNrgGFTA+jZ4ocbfMq/
 NcISe/mMSXIoBq4l8qsBdbffTQjtwSR8YTIN9JbL84kNRv9+D7k1BItDDUoh7m3RS+YV
 bYaReQIMZ8Pu2m1ak3KbAfbZrgDKbtM7DFdvochLFZZPbt1hzV1yQNyIQWNnJgBJ/mY1
 EXeg==
X-Gm-Message-State: ACrzQf2jJC3fVAv2F/qeMimhjIX1KewEbX9QS4JC4YbfKkZzDMc+kVYx
 x3n/DCiKcpevHuzLzjYsMR+6pg==
X-Google-Smtp-Source: AMsMyM6gt0Q106mmjmjdscAhKPW7fIThRKRNEj2Lrp/AgByzvvjlNDDrqgDr+xk8JuLoEG2esLwikg==
X-Received: by 2002:a17:902:ab14:b0:176:9fd4:d61d with SMTP id
 ik20-20020a170902ab1400b001769fd4d61dmr1319404plb.76.1663705326688; 
 Tue, 20 Sep 2022 13:22:06 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a170902c94800b00176b84eb29asm267144pla.301.2022.09.20.13.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 13:22:04 -0700 (PDT)
Date: Tue, 20 Sep 2022 14:22:01 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <20220920202201.GB1042164@p14s>
References: <20220826115232.2163130-1-arnaud.pouliquen@foss.st.com>
 <20220919223027.GG759648@p14s>
 <66e27df5-7697-446d-df7c-eb50e6d06f46@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66e27df5-7697-446d-df7c-eb50e6d06f46@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v8 0/4] remoteproc: restructure the
 remoteproc VirtIO device
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

On Tue, Sep 20, 2022 at 03:44:18PM +0200, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> On 9/20/22 00:30, Mathieu Poirier wrote:
> > Hi,
> > 
> > On Fri, Aug 26, 2022 at 01:52:28PM +0200, Arnaud Pouliquen wrote:
> >> 1) Update from V7 [1]:
> >>
> >> - rebase on rproc-next branch [2], commit 729c16326b7f ("remoteproc: imx_dsp_rproc: fix argument 2 of rproc_mem_entry_init")
> >>   The updates take into account the integration of the
> >>   commit 1404acbb7f68 ("remoteproc: Fix dma_mem leak after rproc_shutdown")
> >> - add Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org> according to reviews on V7
> >>
> >>
> >> [1] https://lkml.org/lkml/2022/7/13/663
> >> [2] https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/log/?h=for-next
> >>
> >> 2) Patchset description:
> >>
> >> This series is a part of the work initiated a long time ago in 
> >> the series "remoteproc: Decorelate virtio from core"[3]
> >>
> >> Objective of the work:
> >> - Update the remoteproc VirtIO device creation (use platform device)
> >> - Allow to declare remoteproc VirtIO device in DT
> >>     - declare resources associated to a remote proc VirtIO
> >>     - declare a list of VirtIO supported by the platform.
> >> - Prepare the enhancement to more VirtIO devices (e.g I2C, audio, video, ...).
> >>   For instance be able to declare a I2C device in a virtio-i2C node.
> >> - Keep the legacy working!
> >> - Try to improve the picture about concerns reported by Christoph Hellwing [4][5]
> >>
> >> [3] https://lkml.org/lkml/2020/4/16/1817
> >> [4] https://lkml.org/lkml/2021/6/23/607
> >> [5] https://patchwork.kernel.org/project/linux-remoteproc/patch/AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch/
> >>
> >> In term of device tree this would result in such hierarchy (stm32mp1 example with 2 virtio RPMSG):
> >>
> >> 	m4_rproc: m4@10000000 {
> >> 		compatible = "st,stm32mp1-m4";
> >> 		reg = <0x10000000 0x40000>,
> >> 		      <0x30000000 0x40000>,
> >> 		      <0x38000000 0x10000>;
> >>         memory-region = <&retram>, <&mcuram>,<&mcuram2>;
> >>         mboxes = <&ipcc 2>, <&ipcc 3>;
> >>         mbox-names = "shutdown", "detach";
> >>         status = "okay";
> >>
> >>         #address-cells = <1>;
> >>         #size-cells = <0>;
> >>         
> >>         vdev@0 {
> >> 		compatible = "rproc-virtio";
> >> 		reg = <0>;
> >> 		virtio,id = <7>;  /* RPMSG */
> >> 		memory-region = <&vdev0vring0>, <&vdev0vring1>, <&vdev0buffer>;
> >> 		mboxes = <&ipcc 0>, <&ipcc 1>;
> >> 		mbox-names = "vq0", "vq1";
> >> 		status = "okay";
> >>         };
> >>
> >>         vdev@1 {
> >> 		compatible = "rproc-virtio";
> >> 		reg = <1>;
> >> 		virtio,id = <7>;  /*RPMSG */
> >> 		memory-region = <&vdev1vring0>, <&vdev1vring1>, <&vdev1buffer>;
> >> 		mboxes = <&ipcc 4>, <&ipcc 5>;
> >> 		mbox-names = "vq0", "vq1";
> >> 		status = "okay";
> >>         };
> >> };
> > 
> > I was in the process of applying this set when the last patch gave me a
> > checkpatch warning about "virtio,rproc" not being documented.
> > 
> > I suggest to introduce a new "virtio-rproc.yaml" based on this work[1], with the
> > above in the example sections.
> 
> Yes I saw the warning, but for this first series it is not possible to declare
> the associated "rproc-virtio" device  in device tree.

I understand and agree with your position.

I am going ahead and merging this set in order for it to get some exposure in
linux-next.  That said be on the ready to address potential problems it may
cause.

> So at this step it seems not make senses to create the devicetree bindings file.
> More than that I don't know how I could justify the properties in bindings if
> there is not driver code associated.
> 
> So i would be in favor of not adding the bindings in this series but to define
> bindings in the first patch of my "step 2" series; as done on my github:
> https://github.com/arnopo/linux/commit/9616d89a4f478cf78865a244efcde108d900f69f
> 
> Please let me know your preference.
> 
> Regards,
> Arnaud
> 
> 
> > 
> > Thanks,
> > Mathieu
> > 
> > [1]. https://elixir.bootlin.com/linux/v6.0-rc6/source/Documentation/devicetree/bindings/virtio/virtio-device.yaml
> > 
> > 
> >>
> >> I have divided the work in 4 steps to simplify the review, This series implements only
> >> the step 1:
> >> step 1: Redefine the remoteproc VirtIO device as a platform device
> >>   - migrate rvdev management in remoteproc virtio.c,
> >>   - create a remotproc virtio config ( can be disabled for platform that not use VirtIO IPC.
> >> step 2: Add possibility to declare and probe a VirtIO sub node
> >>   - VirtIO bindings declaration,
> >>   - multi DT VirtIO devices support,
> >>   - introduction of a remote proc virtio bind device mechanism ,
> >> => https://github.com/arnopo/linux/commits/step2-virtio-in-DT
> >> step 3: Add memory declaration in VirtIO subnode
> >> => https://github.com/arnopo/linux/commits/step3-virtio-memories
> >> step 4: Add mailbox declaration in VirtIO subnode
> >> => https://github.com/arnopo/linux/commits/step4-virtio-mailboxes
> >>
> >> Arnaud Pouliquen (4):
> >>   remoteproc: core: Introduce rproc_rvdev_add_device function
> >>   remoteproc: core: Introduce rproc_add_rvdev function
> >>   remoteproc: Move rproc_vdev management to remoteproc_virtio.c
> >>   remoteproc: virtio: Create platform device for the remoteproc_virtio
> >>
> >>  drivers/remoteproc/remoteproc_core.c     | 154 +++---------------
> >>  drivers/remoteproc/remoteproc_internal.h |  23 ++-
> >>  drivers/remoteproc/remoteproc_virtio.c   | 189 ++++++++++++++++++++---
> >>  include/linux/remoteproc.h               |   6 +-
> >>  4 files changed, 210 insertions(+), 162 deletions(-)
> >>
> >> -- 
> >> 2.24.3
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
