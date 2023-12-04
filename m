Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C88A48037A0
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 15:54:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AF18C6B46B;
	Mon,  4 Dec 2023 14:54:44 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E400BC6B469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 14:54:42 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-77dccb3e4baso303389985a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Dec 2023 06:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701701682; x=1702306482;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bg3OAjxlhkHVroLExkyXrSp7hB9PGqxL9CSH3f9aKos=;
 b=lhAtLdZC8NHHR+DmLoAB4ZPsR1fDxJJwjJNlgKGplD6di6YLMNG5Ubh/qMNEpaQPQw
 DwSd8R5EolykPS4gT9eBQNzadTsKjKLTrCbsfFA9v/KUgIusIPseaLNE4+fvxzlvAW0G
 1vkJVq1zs4lBt+8j8BwNZijB+E7YZopbC0ov6yeDzdyDtcc2FQYXkBrfoSbefSQrsle0
 2o/B22807o8GUoywrU2buFQzEOhl55SnMYyDJ+MzBCHOG/ThK49HQkRpG90AeHTyW5x8
 8Sxm+m8JLptn5qQNT9C8EotWJHbRkGGQKqal+odVUKZAhzsy6rb0cY/n/tlM506AS0QK
 vm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701701682; x=1702306482;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Bg3OAjxlhkHVroLExkyXrSp7hB9PGqxL9CSH3f9aKos=;
 b=eGATw9AT5HKf9XXXULMApCBJ+EdOGhTKPLJcf/b4ZDvw4/xjimUhru/U9Emhl8hNoZ
 MVBosKky8Upx5GmDEx2sjlylc7q9xZBxesjKiopelemodOLTCtveTE1PjJzQYducZxdj
 zDRGEsoScEZRCI09+4gtyfPzWoPe88DJiKy93NlvFpVJ1NiiCJWwdxbhPHcWYmTmJi51
 iuZeBmsVZEM9g/tUVfsfolSYuVklYTZSpLmUi4kIQOvstgMGbw2TrvBBwXITdPDjOICY
 gntnq4x8n+JcWmlgbQzZ1v87dAW9hnNAnD4kVrKwQIjd8WXif+WpntbOonTBA8U51WMc
 6iKg==
X-Gm-Message-State: AOJu0Yz0qtP66vxVzO0ak1PfSO1q0T4KFUSV5hQacozxu6p/8X1eHWgF
 XEERElRLChTIUeki/5WAom8=
X-Google-Smtp-Source: AGHT+IHmGk8EW1nYxUJzot/wHNOP9alDTyqyX08Vu4COc7aS8T/1IoLrhxMpc+DSC3CEsmazSLPpyg==
X-Received: by 2002:a05:6214:11a4:b0:67a:ad71:ce63 with SMTP id
 u4-20020a05621411a400b0067aad71ce63mr4980388qvv.90.1701701681739; 
 Mon, 04 Dec 2023 06:54:41 -0800 (PST)
Received: from localhost (114.66.194.35.bc.googleusercontent.com.
 [35.194.66.114]) by smtp.gmail.com with ESMTPSA id
 l4-20020ac84584000000b00421b14f7e7csm4356420qtn.48.2023.12.04.06.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 06:54:41 -0800 (PST)
Date: Mon, 04 Dec 2023 09:54:40 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>, 
 Song Yoong Siang <yoong.siang.song@intel.com>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Bjorn Topel <bjorn@kernel.org>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@google.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, 
 Willem de Bruijn <willemb@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Mykola Lysenko <mykolal@fb.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Message-ID: <656de830e8d70_2e983e294ca@willemb.c.googlers.com.notmuch>
In-Reply-To: <43b01013-e78b-417e-b169-91909c7309b1@kernel.org>
References: <20231203165129.1740512-1-yoong.siang.song@intel.com>
 <20231203165129.1740512-3-yoong.siang.song@intel.com>
 <43b01013-e78b-417e-b169-91909c7309b1@kernel.org>
Mime-Version: 1.0
Cc: xdp-hints@xdp-project.net, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v3 2/3] net: stmmac: add Launch
 Time support to XDP ZC
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

Jesper Dangaard Brouer wrote:
> 
> 
> On 12/3/23 17:51, Song Yoong Siang wrote:
> > This patch enables Launch Time (Time-Based Scheduling) support to XDP zero
> > copy via XDP Tx metadata framework.
> > 
> > Signed-off-by: Song Yoong Siang<yoong.siang.song@intel.com>
> > ---
> >   drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
> 
> As requested before, I think we need to see another driver implementing 
> this.
> 
> I propose driver igc and chip i225.
> 
> The interesting thing for me is to see how the LaunchTime max 1 second
> into the future[1] is handled code wise. One suggestion is to add a 
> section to Documentation/networking/xsk-tx-metadata.rst per driver that 
> mentions/documents these different hardware limitations.  It is natural 
> that different types of hardware have limitations.  This is a close-to 
> hardware-level abstraction/API, and IMHO as long as we document the 
> limitations we can expose this API without too many limitations for more 
> capable hardware.

I would assume that the kfunc will fail when a value is passed that
cannot be programmed.

What is being implemented here already exists for qdiscs. The FQ
qdisc takes a horizon attribute and

    "
    when a packet is beyond the horizon
        at enqueue() time:
        - either drop the packet (default policy)
        - or cap its delivery time to the horizon.
    "
    commit 39d010504e6b ("net_sched: sch_fq: add horizon attribute")

Having the admin manually configure this on the qdisc based on
off-line knowledge of the device is more fragile than if the device
would somehow signal its limit to the stack.

But I don't think we should add enforcement of that as a requirement
for this xdp extension of pacing.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
