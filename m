Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B3A358252
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Apr 2021 13:44:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2343C5718B;
	Thu,  8 Apr 2021 11:44:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E0D8C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Apr 2021 11:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617882246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ojI36GqCcSZZKDE7ZJzPVmk370WGjalSRm35dXXJjG4=;
 b=cP/38F0Ig561h9crlZ7dPXsSrvSLlzzPpn996I9h/JgowVF3rGQaroA1//Dka/XISWeE4p
 1/p1Y4M8Wgj+FQc3BTlwCjpJ+53/QO1KVR02ziTofeXFV4qo0GntDr/L3YDBNbsh3er0ax
 PtgJZjaDhhI5EwDNDCcn7OiabWIobF4=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-7LMBVEA-MuymOQe3W4MpZA-1; Thu, 08 Apr 2021 07:44:04 -0400
X-MC-Unique: 7LMBVEA-MuymOQe3W4MpZA-1
Received: by mail-pg1-f200.google.com with SMTP id z13so1219412pgi.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Apr 2021 04:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ojI36GqCcSZZKDE7ZJzPVmk370WGjalSRm35dXXJjG4=;
 b=t39SNCXFjFIC1gor8KdKT+5yJyLvt9vC64ldYOvT8GVWAbTxzZczHMVZUaEHG5I9Ly
 9XI0N6fwF+D78CBcqPAvedTIerNDj+cu69GZaaxF15L4hic7sHgmCqhqL9cFdlcXu3qT
 11zq7GcNFgyRyG9ElHcrjSnZD1VLDog9Lc2ZzOA2rE99Ay8p7sRgvqVgoVwSp+I2ZoOj
 CVDHM7AGdVuJG8K/qA/F91kQZ5oyWQlaHE707lcK03w3R6Tsu9JONdLHl8q8S9iTYcVu
 YN+UEYcu1ngZw/2vTOk3g9TRgZngjp/boxqFhwcS2tEpNFGDqlMdOPBRhKuE5GScoJZ5
 aGGA==
X-Gm-Message-State: AOAM533XxZSWeJ5jRNfX4opRiF4wPckRF0gGQEBVNMbSoaCFfjK0vXnc
 QJAytOG95Wyk4RzCTj6v26lFBSxlDSO0rQSFrAEjIZzKOFBqAq1Aob14xLrEKPkrPkmihnJaguG
 Wxq2O6+BuWlfXhFlng2hNAfLZuu8gD0dm6a8k3/Pt0w5ZL/WEe70z3bU4
X-Received: by 2002:a17:90a:bb0c:: with SMTP id
 u12mr8097128pjr.234.1617882243164; 
 Thu, 08 Apr 2021 04:44:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXWoD4uZFLjX3W//O+WsdPii+AkkUpUkXJnA0RNfYAyKcsVoeyvydz2BlU3advUFqA9gChFbY15nQwPpfmGv8=
X-Received: by 2002:a17:90a:bb0c:: with SMTP id
 u12mr8097093pjr.234.1617882242926; 
 Thu, 08 Apr 2021 04:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210326143458.508959-1-lee.jones@linaro.org>
 <20210406085605.GS2916463@dell>
 <CAO-hwJ+5Vd6jC2+0pfHLOw3opdXzKoc9pUWzxmBVhSvQvNWMsQ@mail.gmail.com>
 <20210408070605.GC2961413@dell>
In-Reply-To: <20210408070605.GC2961413@dell>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Thu, 8 Apr 2021 13:43:52 +0200
Message-ID: <CAO-hwJJrn4mzPwzYvusGNa6KhLZ+kCn=svzgGJD=6q+Urz=YsA@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=btissoir@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Zhang Lixu <lixu.zhang@intel.com>, linux-iio <linux-iio@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Anssi Hannula <anssi.hannula@gmail.com>,
 Kim Kuparinen <kimi.h.kuparinen@gmail.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Dario Pagani <dario.pagani.146+linuxk@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Henrik Rydberg <rydberg@bitmath.org>,
 Lopez Casado <nlopezcasad@logitech.com>,
 Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
 Masaki Ota <masaki.ota@jp.alps.com>,
 =?UTF-8?Q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
 Vojtech Pavlik <vojtech@suse.cz>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 linux-media@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>,
 message to <vojtech@ucw.cz>, Jiri Kosina <jikos@kernel.org>, "L. Vinyard,
 Jr" <rvinyard@cs.nmsu.edu>, linaro-mm-sig@lists.linaro.org,
 Michael Haboustak <mike-@cinci.rr.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Daniel Drubin <daniel.drubin@intel.com>,
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [RESEND 00/25] Rid W=1 warnings from HID
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

On Thu, Apr 8, 2021 at 9:06 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Wed, 07 Apr 2021, Benjamin Tissoires wrote:
>
> > On Tue, Apr 6, 2021 at 10:56 AM Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > On Fri, 26 Mar 2021, Lee Jones wrote:
> > >
> > > > This set is part of a larger effort attempting to clean-up W=1
> > > > kernel builds, which are currently overwhelmingly riddled with
> > > > niggly little warnings.
> > > >
> > > > Lee Jones (25):
> > > >   HID: intel-ish-hid: Remove unused variable 'err'
> > > >   HID: ishtp-hid-client: Move variable to where it's actually used
> > > >   HID: intel-ish-hid: pci-ish: Remove unused variable 'ret'
> > > >   HID: intel-ish: Supply some missing param descriptions
> > > >   HID: intel-ish: Fix a naming disparity and a formatting error
> > > >   HID: usbhid: Repair a formatting issue in a struct description
> > > >   HID: intel-ish-hid: Fix a little doc-rot
> > > >   HID: usbhid: hid-pidff: Demote a couple kernel-doc abuses
> > > >   HID: hid-alps: Correct struct misnaming
> > > >   HID: intel-ish-hid: Fix potential copy/paste error
> > > >   HID: hid-core: Fix incorrect function name in header
> > > >   HID: intel-ish-hid: ipc: Correct fw_reset_work_fn() function name in
> > > >     header
> > > >   HID: ishtp-hid-client: Fix incorrect function name report_bad_packet()
> > > >   HID: hid-kye: Fix incorrect function name for kye_tablet_enable()
> > > >   HID: hid-picolcd_core: Remove unused variable 'ret'
> > > >   HID: hid-logitech-hidpp: Fix conformant kernel-doc header and demote
> > > >     abuses
> > > >   HID: hid-uclogic-rdesc: Kernel-doc is for functions and structs
> > > >   HID: hid-thrustmaster: Demote a bunch of kernel-doc abuses
> > > >   HID: hid-uclogic-params: Ensure function names are present and correct
> > > >     in kernel-doc headers
> > > >   HID: hid-sensor-custom: Remove unused variable 'ret'
> > > >   HID: wacom_sys: Demote kernel-doc abuse
> > > >   HID: hid-sensor-hub: Remove unused struct member 'quirks'
> > > >   HID: hid-sensor-hub: Move 'hsdev' description to correct struct
> > > >     definition
> > > >   HID: intel-ish-hid: ishtp-fw-loader: Fix a bunch of formatting issues
> > > >   HID: ishtp-hid-client: Fix 'suggest-attribute=format' compiler warning
> > >
> > > These have been on the list for a couple of weeks now.
> > >
> > > Is there anything I can do to help expedite their merge?
> > >
> > > I'm concerned since -rc6 has just been released.
> >
> > Sorry for the delay.
> >
> > I am currently queuing them locally and running a few tests on them. I
> > don't expect anything to happen, but better be safe than anything.
> >
> > FWIW, I am splitting the series in 3:
> > - 11 patches for intel ish are going to be queued in for-5.13/intel-ish
> > - the thrustmaster one in for-5.13/thrustmaster
> > - the rest (13 patches) will be sent in for-5.13/warnings.
>
> Sounds good to me.  Thanks Benjamin.
>
After a few attempts at fixing my CI, I have now pushed this series as
mentioned previously.

Cheers,
Benjamin

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
