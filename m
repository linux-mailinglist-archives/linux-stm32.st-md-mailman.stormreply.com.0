Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CBC7EE4AB
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Nov 2023 16:50:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B4DCC6C839;
	Thu, 16 Nov 2023 15:50:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D401C6C837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 15:50:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9085B619EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 15:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4284BC433CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 15:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700149837;
 bh=cxGMjfUMzjut3poH5+l7X0G21U7y7WehFTBdbs/Vgp0=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=cLpofF3mET3VoLMtKS3oDf4DKTbx+61luyKr9pdFoz6gDPobrcyMqZCtK9HV/78zi
 FE8xkQgsMtAdScnw0fr03rb1OuC+I/SPmgzYgrcWl3vxynoj9hUsrQLrtEQ5fkToHo
 lzEvLUN4Wvev86RyBnzz7cDJ0eYcSOPQlXUwFWvJayfa1fMN72hM3CRIWkI10cvDs2
 bZX/25CvyfQlnGfOY9flhKG8RHJKWr+YLP1hun8cw3rE7CO8LE49YooIl0TV9/IJ/+
 XFZ/KPGrYwEN2RC44wqlPUoybIFrfMTjq3aODw3RE70tM9XoQXqnabOC9lsG1HMdvD
 B+mkjS3MxJ3cA==
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-565334377d0so716215a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 07:50:37 -0800 (PST)
X-Gm-Message-State: AOJu0YwqxWCX5q5hK5UgJYY3YFVWksw1ofaZp319SXBKxkGIyRIvnYDP
 A5VlSSizwwM+xJ0tHgYq7Jfc1gef0ZCCGAkR72M=
X-Google-Smtp-Source: AGHT+IHWOfeY/Ow8LM2aFdGyBtyRnKWUJ9qen9rlFQ50S/56218qxwI8feHkZCmpQd1uPgRUF1PAKXFv3BeCFKJDH7o=
X-Received: by 2002:a17:90b:4c0f:b0:280:235:19d with SMTP id
 na15-20020a17090b4c0f00b002800235019dmr15928923pjb.36.1700149836898; Thu, 16
 Nov 2023 07:50:36 -0800 (PST)
MIME-Version: 1.0
References: <20231116154816.70959-1-andrzej.p@collabora.com>
 <20231116154816.70959-3-andrzej.p@collabora.com>
In-Reply-To: <20231116154816.70959-3-andrzej.p@collabora.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 16 Nov 2023 23:50:26 +0800
X-Gmail-Original-Message-ID: <CAGb2v65BrPzctN_nxW-updoOvedLT4poQt_FL_S6Yyh61WQcZw@mail.gmail.com>
Message-ID: <CAGb2v65BrPzctN_nxW-updoOvedLT4poQt_FL_S6Yyh61WQcZw@mail.gmail.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [RFC 2/6] media: verisilicon: Correct a typo in
	H1_REG_MAD_CTRL_MAD_THRESHOLD
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
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVGh1LCBOb3YgMTYsIDIwMjMgYXQgMTE6NDjigK9QTSBBbmRyemVqIFBpZXRyYXNpZXdpY3oK
PGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IEl0J3MgYSBUSFJFU0hPTEQgYW5k
IG5vdCBhIFRIUkVESE9MRC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2lj
eiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+CgpSZXZpZXdlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3
ZW5zQGNzaWUub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
