Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B5A5F6058
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Oct 2022 06:55:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29314C64100;
	Thu,  6 Oct 2022 04:55:49 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5133C63324
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Oct 2022 04:55:46 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id r18so833606pgr.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Oct 2022 21:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=51dSYIsgEywaJmdEPyI7vbp82hVQfJ6jQKHayIqsWH8=;
 b=e0wWc8f7UVTw3oXSVMh5SbOC8/ybqXORh0RfOsp37foz3bEHC+sZdUS2Cb48q2Rals
 cLwchuP5t4lVTMm+j0edXnLdA6eiOkpTvFVeI+b/+yanhEnnWG77EYRopMXRVrLoop3K
 nYwrVibqoZRWrTFw38o2fgxxWy4pLnB/kciNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=51dSYIsgEywaJmdEPyI7vbp82hVQfJ6jQKHayIqsWH8=;
 b=3I3ukjgh+RMR4EpHKMFa4z8FqR9jCpAj3xpHq4nqIPzo5OQRC/WaDQ9EEqa6Fb/+2f
 xFKVpq4IOjcKgp1K20Gb8ZmXXkeTpR+rUZm94ULfUOdX6PfJ9+pC34r3G+jHgpQ8cAvh
 PfTBVH5drukLNNwLClK6ZPnTrUy5i/hEiPDmCsW6TuF7lo/E0hyxEFbzf90T4r8g77La
 px/e7UTKOLVSzO/aNmsSvUKE7K8Fp4Van5Ol48ZyY7tiJ4JR06upFKYVVnhRwrnxMxT8
 cKS13yoXTErijZt1zDraGEAioOFXoV08duUhGvupLwI0uoJzE/G4f15/dHwNgVAuY1Nr
 azmQ==
X-Gm-Message-State: ACrzQf3yRfDYpKHORsPsg5Evj5/9XwVLlFIC4ROM6d1xfUabX8JE1clF
 lMcIdwHczaqGQ2/TWM2mPU0OWQ==
X-Google-Smtp-Source: AMsMyM48HYcC17YfWxdcqN47yJn5oQWwbAuWOEmTE9E3JPhKRJg4eKNbmI4Bm6DfbK3tY9AIwV8yDw==
X-Received: by 2002:a63:d613:0:b0:45a:654:cf16 with SMTP id
 q19-20020a63d613000000b0045a0654cf16mr2835844pgg.611.1665032145428; 
 Wed, 05 Oct 2022 21:55:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a17090302ce00b0017a09ebd1e2sm11252393plk.237.2022.10.05.21.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 21:55:44 -0700 (PDT)
Date: Wed, 5 Oct 2022 21:55:43 -0700
From: Kees Cook <keescook@chromium.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <202210052148.B11CBC60@keescook>
References: <20221005214844.2699-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221005214844.2699-1-Jason@zx2c4.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "Darrick J . Wong" <djwong@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, dri-devel@lists.freedesktop.org,
 Andrii Nakryiko <andrii@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-sctp@vger.kernel.org, "Md . Haris Iqbal" <haris.iqbal@ionos.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Christoph Hellwig <hch@lst.de>,
 Andy Gospodarek <andy@greyhouse.net>, Sergey Matyukevich <geomatsi@gmail.com>,
 Rohit Maheshwari <rohitm@chelsio.com>, Michael Ellerman <mpe@ellerman.id.au>,
 ceph-devel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Nilesh Javali <njavali@marvell.com>,
 Jean-Paul Roubelat <jpr@f6fbb.org>, Dick Kennedy <dick.kennedy@broadcom.com>,
 Jay Vosburgh <j.vosburgh@gmail.com>, Potnuri Bharat Teja <bharat@chelsio.com>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>, linux-nfs@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Igor Mitsyanko <imitsyanko@quantenna.com>,
 Andy Lutomirski <luto@kernel.org>, linux-hams@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-raid@vger.kernel.org,
 Neil Horman <nhorman@tuxdriver.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Michael Chan <michael.chan@broadcom.com>, linux-kernel@vger.kernel.org,
 Varun Prakash <varun@chelsio.com>, Chuck Lever <chuck.lever@oracle.com>,
 netfilter-devel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
 linux-media@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Sharvari Harisangam <sharvari.harisangam@nxp.com>, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, target-devel@vger.kernel.org,
 John Stultz <jstultz@google.com>, Stanislav Fomichev <sdf@google.com>,
 Gregory Greenman <gregory.greenman@intel.com>, drbd-dev@lists.linbit.com,
 dev@openvswitch.org, Leon Romanovsky <leon@kernel.org>,
 Helge Deller <deller@gmx.de>, Hugh Dickins <hughd@google.com>,
 James Smart <james.smart@broadcom.com>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Pravin B Shelar <pshelar@ovn.org>, Julian Anastasov <ja@ssi.bg>,
 coreteam@netfilter.org, Veaceslav Falico <vfalico@gmail.com>,
 Yonghong Song <yhs@fb.com>, Namjae Jeon <linkinjeon@kernel.org>,
 linux-crypto@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 Ganapathi Bhat <ganapathi017@gmail.com>, linux-actions@lists.infradead.org,
 Simon Horman <horms@verge.net.au>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>,
 Theodore Ts'o <tytso@mit.edu>, Stephen Boyd <sboyd@kernel.org>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Florian Westphal <fw@strlen.de>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Jon Maloy <jmaloy@redhat.com>, Vlad Yasevich <vyasevich@gmail.com>,
 Anna Schumaker <anna@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Haoyue Xu <xuhaoyue1@hisilicon.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-wireless@vger.kernel.org,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-nvme@lists.infradead.org,
 Michal Januszewski <spock@gentoo.org>, linux-mtd@lists.infradead.org,
 kasan-dev@googlegroups.com, Cong Wang <xiyou.wangcong@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>,
 Ajay Singh <ajay.kathat@microchip.com>, Xiubo Li <xiubli@redhat.com>,
 Sagi Grimberg <sagi@grimberg.me>, Daniel Borkmann <daniel@iogearbox.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 lvs-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
 Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, Marco Elver <elver@google.com>,
 Yury Norov <yury.norov@gmail.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Jamal Hadi Salim <jhs@mojatatu.com>, KP Singh <kpsingh@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Keith Busch <kbusch@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Franky Lin <franky.lin@broadcom.com>, Arend van Spriel <aspriel@gmail.com>,
 linux-ext4@vger.kernel.org, Wenpeng Liang <liangwenpeng@huawei.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Xinming Hu <huxinming820@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jeff Layton <jlayton@kernel.org>, linux-xfs@vger.kernel.org,
 netdev@vger.kernel.org, Ying Xue <ying.xue@windriver.com>,
 Manish Rangankar <mrangankar@marvell.com>,
 "David S . Miller" <davem@davemloft.net>,
 Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>,
 Vignesh Raghavendra <vigneshr@ti.com>, Peter Zijlstra <peterz@infradead.org>,
 "H . Peter Anvin" <hpa@zytor.com>, Amitkumar Karwar <amitkarwar@gmail.com>,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Ayush Sawal <ayush.sawal@chelsio.com>,
 Andreas Noever <andreas.noever@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 linux-f2fs-devel@lists.sourceforge.net, Jack Wang <jinpu.wang@ionos.com>,
 Steffen Klassert <steffen.klassert@secunet.com>, rds-devel@oss.oracle.com,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 dccp@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, Jaehoon Chung <jh80.chung@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, SHA-cyfmac-dev-list@infineon.com,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Jamet <michael.jamet@intel.com>, Kalle Valo <kvalo@kernel.org>,
 Chao Yu <chao@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>,
 linux-block@vger.kernel.org, dmaengine@vger.kernel.org,
 Hannes Reinecke <hare@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, Jens Axboe <axboe@kernel.dk>,
 cake@lists.bufferbloat.net, brcm80211-dev-list.pdl@broadcom.com,
 Yishai Hadas <yishaih@nvidia.com>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 linuxppc-dev@lists.ozlabs.org, David Ahern <dsahern@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Vinod Koul <vkoul@kernel.org>, tipc-discussion@lists.sourceforge.net,
 Thomas Graf <tgraf@suug.ch>, Johannes Berg <johannes@sipsolutions.net>,
 Sungjong Seo <sj1557.seo@samsung.com>, Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [PATCH v1 0/5] treewide cleanup of random integer
	usage
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gV2VkLCBPY3QgMDUsIDIwMjIgYXQgMTE6NDg6MzlQTSArMDIwMCwgSmFzb24gQS4gRG9uZW5m
ZWxkIHdyb3RlOgo+IEhpIGZvbGtzLAo+IAo+IFRoaXMgaXMgYSBmaXZlIHBhcnQgdHJlZXdpZGUg
Y2xlYW51cCBvZiByYW5kb20gaW50ZWdlciBoYW5kbGluZy4gVGhlCj4gcnVsZXMgZm9yIHJhbmRv
bSBpbnRlZ2VycyBhcmU6Cj4gCj4gLSBJZiB5b3Ugd2FudCBhIHNlY3VyZSBvciBhbiBpbnNlY3Vy
ZSByYW5kb20gdTY0LCB1c2UgZ2V0X3JhbmRvbV91NjQoKS4KPiAtIElmIHlvdSB3YW50IGEgc2Vj
dXJlIG9yIGFuIGluc2VjdXJlIHJhbmRvbSB1MzIsIHVzZSBnZXRfcmFuZG9tX3UzMigpLgo+ICAg
KiBUaGUgb2xkIGZ1bmN0aW9uIHByYW5kb21fdTMyKCkgaGFzIGJlZW4gZGVwcmVjYXRlZCBmb3Ig
YSB3aGlsZSBub3cKPiAgICAgYW5kIGlzIGp1c3QgYSB3cmFwcGVyIGFyb3VuZCBnZXRfcmFuZG9t
X3UzMigpLgo+IC0gSWYgeW91IHdhbnQgYSBzZWN1cmUgb3IgYW4gaW5zZWN1cmUgcmFuZG9tIHUx
NiwgdXNlIGdldF9yYW5kb21fdTE2KCkuCj4gLSBJZiB5b3Ugd2FudCBhIHNlY3VyZSBvciBhbiBp
bnNlY3VyZSByYW5kb20gdTgsIHVzZSBnZXRfcmFuZG9tX3U4KCkuCj4gLSBJZiB5b3Ugd2FudCBz
ZWN1cmUgb3IgaW5zZWN1cmUgcmFuZG9tIGJ5dGVzLCB1c2UgZ2V0X3JhbmRvbV9ieXRlcygpLgo+
ICAgKiBUaGUgb2xkIGZ1bmN0aW9uIHByYW5kb21fYnl0ZXMoKSBoYXMgYmVlbiBkZXByZWNhdGVk
IGZvciBhIHdoaWxlIG5vdwo+ICAgICBhbmQgaGFzIGxvbmcgYmVlbiBhIHdyYXBwZXIgYXJvdW5k
IGdldF9yYW5kb21fYnl0ZXMoKS4KPiAtIElmIHlvdSB3YW50IGEgbm9uLXVuaWZvcm0gcmFuZG9t
IHUzMiwgdTE2LCBvciB1OCBib3VuZGVkIGJ5IGEgY2VydGFpbgo+ICAgb3BlbiBpbnRlcnZhbCBt
YXhpbXVtLCB1c2UgcHJhbmRvbV91MzJfbWF4KCkuCj4gICAqIEkgc2F5ICJub24tdW5pZm9ybSIs
IGJlY2F1c2UgaXQgZG9lc24ndCBkbyBhbnkgcmVqZWN0aW9uIHNhbXBsaW5nIG9yCj4gICAgIGRp
dmlzaW9ucy4gSGVuY2UsIGl0IHN0YXlzIHdpdGhpbiB0aGUgcHJhbmRvbV8qIG5hbWVzcGFjZS4K
PiAKPiBUaGVzZSBydWxlcyBvdWdodCB0byBiZSBhcHBsaWVkIHVuaWZvcm1seSwgc28gdGhhdCB3
ZSBjYW4gY2xlYW4gdXAgdGhlCj4gZGVwcmVjYXRlZCBmdW5jdGlvbnMsIGFuZCBlYXJuIHRoZSBi
ZW5lZml0cyBvZiB1c2luZyB0aGUgbW9kZXJuCj4gZnVuY3Rpb25zLiBJbiBwYXJ0aWN1bGFyLCBp
biBhZGRpdGlvbiB0byB0aGUgYm9yaW5nIHN1YnN0aXR1dGlvbnMsIHRoaXMKPiBwYXRjaHNldCBh
Y2NvbXBsaXNoZXMgYSBmZXcgbmljZSBlZmZlY3RzOgo+IAo+IC0gQnkgdXNpbmcgcHJhbmRvbV91
MzJfbWF4KCkgd2l0aCBhbiB1cHBlci1ib3VuZCB0aGF0IHRoZSBjb21waWxlciBjYW4KPiAgIHBy
b3ZlIGF0IGNvbXBpbGUtdGltZSBpcyDiiaQ2NTUzNiBvciDiiaQyNTYsIGludGVybmFsbHkgZ2V0
X3JhbmRvbV91MTYoKQo+ICAgb3IgZ2V0X3JhbmRvbV91OCgpIGlzIHVzZWQsIHdoaWNoIHdhc3Rl
cyBmZXdlciBiYXRjaGVkIHJhbmRvbSBieXRlcywKPiAgIGFuZCBoZW5jZSBoYXMgaGlnaGVyIHRo
cm91Z2hwdXQuCj4gCj4gLSBCeSB1c2luZyBwcmFuZG9tX3UzMl9tYXgoKSBpbnN0ZWFkIG9mICUs
IHdoZW4gdGhlIHVwcGVyLWJvdW5kIGlzIG5vdCBhCj4gICBjb25zdGFudCwgZGl2aXNpb24gaXMg
c3RpbGwgYXZvaWRlZCwgYmVjYXVzZSBwcmFuZG9tX3UzMl9tYXgoKSB1c2VzCj4gICBhIGZhc3Rl
ciBtdWx0aXBsaWNhdGlvbi1iYXNlZCB0cmljayBpbnN0ZWFkLgo+IAo+IC0gQnkgdXNpbmcgZ2V0
X3JhbmRvbV91MTYoKSBvciBnZXRfcmFuZG9tX3U4KCkgaW4gY2FzZXMgd2hlcmUgdGhlIHJldHVy
bgo+ICAgdmFsdWUgaXMgaW50ZW5kZWQgdG8gaW5kZWVkIGJlIGEgdTE2IG9yIGEgdTgsIHdlIHdh
c3RlIGZld2VyIGJhdGNoZWQKPiAgIHJhbmRvbSBieXRlcywgYW5kIGhlbmNlIGhhdmUgaGlnaGVy
IHRocm91Z2hwdXQuCj4gCj4gU28sIGJhc2VkIG9uIHRob3NlIHJ1bGVzIGFuZCBiZW5lZml0cyBm
cm9tIGZvbGxvd2luZyB0aGVtLCB0aGlzIHBhdGNoc2V0Cj4gYnJlYWtzIGRvd24gaW50byB0aGUg
Zm9sbG93aW5nIGZpdmUgc3RlcHM6Cj4gCj4gMSkgUmVwbGFjZSBgcHJhbmRvbV91MzIoKSAlIG1h
eGAgYW5kIHZhcmlhbnRzIHRoZXJlb2Ygd2l0aAo+ICAgIHByYW5kb21fdTMyX21heChtYXgpLgo+
IAo+IDIpIFJlcGxhY2UgYCh0eXBlKWdldF9yYW5kb21fdTMyKClgIGFuZCB2YXJpYW50cyB0aGVy
ZW9mIHdpdGgKPiAgICBnZXRfcmFuZG9tX3UxNigpIG9yIGdldF9yYW5kb21fdTgoKS4gSSB0b29r
IHRoZSBwYWlucyB0byBhY3R1YWxseQo+ICAgIGxvb2sgYW5kIHNlZSB3aGF0IGV2ZXJ5IGx2YWx1
ZSB0eXBlIHdhcyBhY3Jvc3MgdGhlIGVudGlyZSB0cmVlLgo+IAo+IDMpIFJlcGxhY2UgcmVtYWlu
aW5nIGRlcHJlY2F0ZWQgdXNlcyBvZiBwcmFuZG9tX3UzMigpIHdpdGgKPiAgICBnZXRfcmFuZG9t
X3UzMigpLiAKPiAKPiA0KSBSZXBsYWNlIHJlbWFpbmluZyBkZXByZWNhdGVkIHVzZXMgb2YgcHJh
bmRvbV9ieXRlcygpIHdpdGgKPiAgICBnZXRfcmFuZG9tX2J5dGVzKCkuCj4gCj4gNSkgUmVtb3Zl
IHRoZSBkZXByZWNhdGVkIGFuZCBub3ctdW51c2VkIHByYW5kb21fdTMyKCkgYW5kCj4gICAgcHJh
bmRvbV9ieXRlcygpIGlubGluZSB3cmFwcGVyIGZ1bmN0aW9ucy4KPiAKPiBJIHdhcyB0aGlua2lu
ZyBvZiB0YWtpbmcgdGhpcyB0aHJvdWdoIG15IHJhbmRvbS5naXQgdHJlZSAob24gd2hpY2ggdGhp
cwo+IHNlcmllcyBpcyBjdXJyZW50bHkgYmFzZWQpIGFuZCBzdWJtaXR0aW5nIGl0IG5lYXIgdGhl
IGVuZCBvZiB0aGUgbWVyZ2UKPiB3aW5kb3csIG9yIHdhaXRpbmcgZm9yIHRoZSB2ZXJ5IGVuZCBv
ZiB0aGUgNi4xIGN5Y2xlIHdoZW4gdGhlcmUgd2lsbCBiZQo+IHRoZSBmZXdlc3QgbmV3IHBhdGNo
ZXMgYnJld2luZy4gSWYgc29tZWJvZHkgd2l0aCBzb21lIHRyZWV3aWRlLWNsZWFudXAKPiBleHBl
cmllbmNlIG1pZ2h0IHNoYXJlIHNvbWUgd2lzZG9tIGFib3V0IHdoYXQgdGhlIGJlc3QgdGltaW5n
IHVzdWFsbHkKPiB3aW5kcyB1cCBiZWluZywgSSdtIGFsbCBlYXJzLgoKSXQnZCBiZSBuaWNlIHRv
IGNhcHR1cmUgc29tZSAoYWxsPykgb2YgdGhlIGFib3ZlIHNvbWV3aGVyZS4gUGVyaGFwcyBqdXN0
CmEgbWFzc2l2ZSBjb21tZW50IGluIHRoZSBoZWFkZXI/Cgo+IEkndmUgQ0MnZCBnZXRfbWFpbnRh
aW5lcnMucGwsIHdoaWNoIGlzIGEgcHJldHR5IGJpZyBsaXN0LiBQcm9iYWJseSBzb21lCj4gcG9y
dGlvbiBvZiB0aG9zZSBhcmUgZ29pbmcgdG8gYm91bmNlLCB0b28sIGFuZCBldmVyeXRpbWUgeW91
IHJlcGx5IHRvCj4gdGhpcyB0aHJlYWQsIHlvdSdsbCBoYXZlIHRvIGRlYWwgd2l0aCBhIGJ1bmNo
IG9mIGJvdW5jZXMgY29taW5nCj4gaW1tZWRpYXRlbHkgYWZ0ZXIuIEFuZCBhIHJlY2lwaWVudCBs
aXN0IHRoaXMgYmlnIHdpbGwgcHJvYmFibHkgZG9jayBteQo+IGVtYWlsIGRvbWFpbidzIHNwYW0g
cmVwdXRhdGlvbiwgYXQgbGVhc3QgdGVtcG9yYXJpbHkuIFNpZ2guIEkgdGhpbmsKPiB0aGF0J3Mg
anVzdCBob3cgaXQgZ29lcyB3aXRoIHRyZWV3aWRlIGNsZWFudXBzIHRob3VnaC4gQWdhaW4sIGxl
dCBtZQo+IGtub3cgaWYgSSdtIGRvaW5nIGl0IHdyb25nLgoKSSB1c3VhbGx5IHN0aWNrIHRvIGp1
c3QgbWFpbGluZyBsaXN0cyBhbmQgc3Vic3lzdGVtIG1haW50YWluZXJzLgoKSWYgYW55IG9mIHRo
ZSBzdWJzeXN0ZW1zIGFzayB5b3UgdG8gYnJlYWsgdGhpcyB1cCAoSSBob3BlIG5vdCksIEkndmUg
Z290CnRoaXNbMV0sIHdoaWNoIGRvZXMgYSByZWFzb25hYmxlIGpvYiBvZiBzcGxpdHRpbmcgYSBj
b21taXQgdXAgaW50bwpzZXBhcmF0ZSBjb21taXRzIGZvciBlYWNoIG1hdGNoaW5nIHN1YnN5c3Rl
bS4KClNob3dpbmcgdGhhdCBhIHRyZWV3aWRlIGNoYW5nZSBjYW4gYmUgcmVwcm9kdWNlZCBtZWNo
YW5pY2FsbHkgaGVscHMgd2l0aAprZWVwaW5nIGl0IHRvZ2V0aGVyIGFzIG9uZSBiaXQgdHJlZXdp
ZGUgcGF0Y2gsIHRvbywgSSd2ZSBmb3VuZC4gOikKClRoYW5rIHlvdSBmb3IgdGhlIGNsZWFudXAh
IFRoZSAidTggcm5kID0gZ2V0X3JhbmRvbV91MzIoKSIgaW4gdGhlIHRyZWUKaGFzIGJvdGhlcmVk
IG1lIGZvciBhIGxvb29vbmcgdGltZS4KCi1LZWVzCgotLSAKS2VlcyBDb29rCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
