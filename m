Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0I6ZAnoZsWn6qgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:54 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8089925DE8C
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39258C90088;
	Wed, 11 Mar 2026 07:27:53 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 249F1C8F299
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 14:27:35 +0000 (UTC)
Received: from macsyma.thunk.org (pool-173-48-117-133.bstnma.fios.verizon.net
 [173.48.117.133]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 62AENmq6023242
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Mar 2026 10:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1773152641; bh=4/p8AtxdJ3b4aYgpRIBgOOPVM9R5HZLzlaxPPsEZ2Q4=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=hiTGUpPYFw4iveFcnThssEtGqck5bTlcAtCwAzdpVmGbR5WmFpAN2HyWID/ccA+sq
 2OK/AXhkKUQYPFyNgldUw+w61jicqaxoKykv03Hk3VtZ73QUkQv/ShdMM7pO1Vbh1a
 Xk4tT0COuhfaHYWaZKCWsHuD29zxMuRmR5Ykqk3er9zqUvUMdMKew+GQv1LtOTBxlB
 9SKJM2ZPrQXCGLMPErKwsY9qom7+Zh2xZP5ck6TXuRn2uQTZsbDvUobUvHn1AWEf75
 4PfPTaD9e2RUncsHaE7PIu6HoXSVAksOxzBRc+Tva5rnUy07kKpb09wYJf74ZjBbdj
 lcU2CraxZ3IiQ==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
 id 96A8A5C4FCED; Tue, 10 Mar 2026 10:23:48 -0400 (EDT)
Date: Tue, 10 Mar 2026 10:23:48 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Philipp Hahn <phahn-oss@avm.de>
Message-ID: <20260310142348.GA41218@macsyma-wired.lan>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
X-Mailman-Approved-At: Wed, 11 Mar 2026 07:27:23 +0000
Cc: Latchesar Ionkov <lucho@ionkov.net>, Juri Lelli <juri.lelli@redhat.com>,
 Justin Sanders <justin@coraid.com>, Paulo Alcantara <pc@manguebit.org>,
 Igor Russkikh <irusskikh@marvell.com>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Ben Segall <bsegall@google.com>, linux-sctp@vger.kernel.org,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 David Vernet <void@manifault.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-clk@vger.kernel.org,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Anna Schumaker <anna@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 linux-omap@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Long Li <longli@microsoft.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 James Morris <jmorris@namei.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Andrea Righi <arighi@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, dm-devel@lists.linux.dev,
 Shyam Prasad N <sprasad@microsoft.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
 Jesper Dangaard Brouer <hawk@kernel.org>, linux-pm@vger.kernel.org,
 Potnuri Bharat Teja <bharat@chelsio.com>, linux-sound@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Christian Brauner <brauner@kernel.org>,
 Chris Mason <clm@fb.com>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 David Ahern <dsahern@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Chuck Lever <chuck.lever@oracle.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org,
 Trond Myklebust <trondmy@kernel.org>,
 Quan Nguyen <quan@os.amperecomputing.com>, linux-hyperv@vger.kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Sandeep Dhavale <dhavale@google.com>, Jeff Layton <jlayton@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Eric Dumazet <edumazet@google.com>, target-devel@vger.kernel.org,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Alasdair Kergon <agk@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, linux-cifs@vger.kernel.org,
 Valentin Schneider <vschneid@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Paul Moore <paul@paul-moore.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Mark Greer <mgreer@animalcreek.com>,
 Gregory Clement <gregory.clement@bootlin.com>, Lee Jones <lee@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 Olga Kornievskaia <okorniev@redhat.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Pavel Machek <pavel@kernel.org>, apparmor@lists.ubuntu.com,
 Mike Snitzer <snitzer@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-gpio@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Michael Chan <mchan@broadcom.com>, Xin Long <lucien.xin@gmail.com>,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Tom Talpey <tom@talpey.com>, Tony Luck <tony.luck@intel.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>, Dave Penkler <dpenkler@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jon Maloy <jmaloy@redhat.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Hongbo Li <lihongbo22@huawei.com>, Simon Horman <horms@kernel.org>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>, Andy Yan <andy.yan@rock-chips.com>,
 Benjamin Marzinski <bmarzins@redhat.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Taras Chornyi <taras.chornyi@plvision.eu>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
 Kees Cook <kees@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Alexei Starovoitov <ast@kernel.org>, David Sterba <dsterba@suse.com>,
 linux-mtd@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-phy@lists.infradead.org,
 Chunhai Guo <guochunhai@vivo.com>, Will Deacon <will@kernel.org>,
 Zhi Wang <zhi.wang.linux@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Miklos Szeredi <miklos@szeredi.hu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Dexuan Cui <decui@microsoft.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 amd-gfx@lists.freedesktop.org, Stanislav Fomichev <sdf@fomichev.me>,
 Viacheslav Dubeyko <slava@dubeyko.com>,
 Sami Tolvanen <samitolvanen@google.com>, linux-input@vger.kernel.org,
 NeilBrown <neil@brown.name>, Vinod Koul <vkoul@kernel.org>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Mel Gorman <mgorman@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Petr Pavlu <petr.pavlu@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 intel-gfx@lists.freedesktop.org, Jamal Hadi Salim <jhs@mojatatu.com>,
 Steven Rostedt <rostedt@goodmis.org>, Robert Foss <rfoss@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 John Crispin <john@phrozen.org>, ceph-devel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Gao Xiang <xiang@kernel.org>,
 cocci@inria.fr, gfs2@lists.linux.dev, linux-nfs@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Linus Walleij <linusw@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 samba-technical@lists.samba.org, Liam Girdwood <lgirdwood@gmail.com>,
 Steve French <sfrench@samba.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 Aaron Tomlin <atomlin@atomlin.com>, Changwoo Min <changwoo@igalia.com>,
 Keerthy <j-keerthy@ti.com>, Tejun Heo <tj@kernel.org>,
 sched-ext@lists.linux.dev, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Rich Felker <dalias@libc.org>,
 Jan Kara <jack@suse.cz>, Vignesh Raghavendra <vigneshr@ti.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, Takashi Iwai <tiwai@suse.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-mm@kvack.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Alex Williamson <alex@shazbot.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Daniel Gomez <da.gomez@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Russell King <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 linux-leds@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>,
 linux-scsi@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Jonas Karlman <jonas@kwiboo.se>,
 Dai Ngo <Dai.Ngo@oracle.com>, Ingo Molnar <mingo@redhat.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Marcel Holtmann <marcel@holtmann.org>,
 Thomas Gleixner <tglx@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, linux-s390@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, Chao Yu <chao@kernel.org>,
 Nicolas Palix <nicolas.palix@imag.fr>, linux-block@vger.kernel.org,
 Bharath SM <bharathsm@microsoft.com>, Mikulas Patocka <mpatocka@redhat.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 x86@kernel.org, Yue Hu <zbestahu@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 John Johansen <john.johansen@canonical.com>,
 Eduardo Valentin <edubezval@gmail.com>, netdev@vger.kernel.org,
 v9fs@lists.linux.dev, linux-mips@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, Andrew Lunn <andrew@lunn.ch>,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Richard Weinberger <richard@nod.at>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Johannes Berg <johannes@sipsolutions.net>, Stephen Boyd <sboyd@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-modules@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/61] treewide: Use IS_ERR_OR_NULL over
 manual NULL check - refactor
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
X-Rspamd-Queue-Id: 8089925DE8C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[mit.edu:s=outgoing];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[mit.edu : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tytso@mit.edu,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phahn-oss@avm.de,m:lucho@ionkov.net,m:juri.lelli@redhat.com,m:justin@coraid.com,m:pc@manguebit.org,m:irusskikh@marvell.com,m:linux-sh@vger.kernel.org,m:catalin.marinas@arm.com,m:rodrigo.vivi@intel.com,m:ulf.hansson@linaro.org,m:dri-devel@lists.freedesktop.org,m:perex@perex.cz,m:bsegall@google.com,m:linux-sctp@vger.kernel.org,m:iyappan@os.amperecomputing.com,m:void@manifault.com,m:miquel.raynal@bootlin.com,m:agordeev@linux.ibm.com,m:kys@microsoft.com,m:linux-clk@vger.kernel.org,m:heiko@sntech.de,m:anna@kernel.org,m:wei.liu@kernel.org,m:linux-omap@vger.kernel.org,m:vincent.guittot@linaro.org,m:longli@microsoft.com,m:rafael@kernel.org,m:jmorris@namei.org,m:tursulin@ursulin.net,m:arighi@nvidia.com,m:borntraeger@linux.ibm.com,m:dm-devel@lists.linux.dev,m:sprasad@microsoft.com,m:daniel.lezcano@kernel.org,m:jiri@resnulli.us,m:hawk@kernel.org,m:linux-pm@vger.kernel.org,m:bharat@chelsio.com,m:linux-sound@vger.kernel.org,m:tsbogend@alpha.franken.de,m:viro@zeniv.linux
 .org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:ericvh@kernel.org,m:dietmar.eggemann@arm.com,m:serge@hallyn.com,m:brauner@kernel.org,m:clm@fb.com,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dsahern@kernel.org,m:mcgrof@kernel.org,m:chuck.lever@oracle.com,m:mhiramat@kernel.org,m:lukasz.luba@arm.com,m:jack@suse.com,m:linux-fsdevel@vger.kernel.org,m:djakov@kernel.org,m:akpm@linux-foundation.org,m:linux-trace-kernel@vger.kernel.org,m:trondmy@kernel.org,m:quan@os.amperecomputing.com,m:linux-hyperv@vger.kernel.org,m:s.nawrocki@samsung.com,m:dhavale@google.com,m:jlayton@kernel.org,m:dave.hansen@linux.intel.com,m:jcmvbkbc@gmail.com,m:edumazet@google.com,m:target-devel@vger.kernel.org,m:anthony.l.nguyen@intel.com,m:sebastian.hesselbarth@gmail.com,m:alexander.deucher@amd.com,m:agk@redhat.com,m:simona@ffwll.ch,m:linux-cifs@vger.kernel.org,m:vschneid@redhat.com,m:hpa@zytor.com,m:paul@paul-moore.com,m:ysato@users.sourceforge.jp
 ,m:andrew+netdev@lunn.ch,m:mgreer@animalcreek.com,m:gregory.clement@bootlin.com,m:lee@kernel.org,m:john.fastabend@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rockchip@lists.infradead.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:okorniev@redhat.com,m:gor@linux.ibm.com,m:pavel@kernel.org,m:apparmor@lists.ubuntu.com,m:snitzer@kernel.org,m:mripard@kernel.org,m:linux-gpio@vger.kernel.org,m:jani.nikula@linux.intel.com,m:mchan@broadcom.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mit.edu:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[246];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tytso@mit.edu,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ionkov.net,redhat.com,coraid.com,manguebit.org,marvell.com,vger.kernel.org,arm.com,intel.com,linaro.org,lists.freedesktop.org,perex.cz,google.com,os.amperecomputing.com,manifault.com,bootlin.com,linux.ibm.com,microsoft.com,sntech.de,kernel.org,namei.org,ursulin.net,nvidia.com,lists.linux.dev,resnulli.us,chelsio.com,alpha.franken.de,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,hallyn.com,fb.com,oracle.com,suse.com,linux-foundation.org,samsung.com,linux.intel.com,amd.com,ffwll.ch,zytor.com,paul-moore.com,users.sourceforge.jp,lunn.ch,animalcreek.com,st-md-mailman.stormreply.com,lists.infradead.org,lists.ubuntu.com,broadcom.com,talpey.com,rock-chips.com,igalia.com,huawei.com,plvision.eu,baylibre.com,ideasonboard.com,vivo.com,iogearbox.net,szeredi.hu,fomichev.me,dubeyko.com,brown.name,suse.de,pengutronix.de,mojatatu.com,goodmis.org,efficios.com,phrozen.org,inria.fr,lists.samba.org,samba.org,atomlin.com,ti.com,lists.ozlabs.org,davemloft.net,libc.org,suse.cz,infradead
 .org,codewreck.org,crudebyte.com,paragon-software.com,kvack.org,shazbot.org,dilger.ca,alien8.de,armlinux.org.uk,8bytes.org,kwiboo.se,lists.osuosl.org,holtmann.org,linuxfoundation.org,imag.fr,linux.alibaba.com,kernel.dk,canonical.com,lists.sourceforge.net,nod.at,squashfs.org.uk,sipsolutions.net];
	NEURAL_HAM(-0.00)[-0.926];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 12:48:26PM +0100, Philipp Hahn wrote:
> While doing some static code analysis I stumbled over a common pattern,
> where IS_ERR() is combined with a NULL check. For that there is
> IS_ERR_OR_NULL().
> 
> I've written a Coccinelle patch to find and patch those instances.
> The patches follow grouped by subsystem.

I'm going to gently suggest that you *not* try to do this as a
tree-wide change, since we don't need to change some interface
requiring a global, flag day change.  This is instead a cleanup, which
maybe makes the code slightly better, but which also has a the
downside of breaking lots of inflight development patches by
potentially causing merge or patch conflicts.

So why don't you send it to each subsystem as a separate patch or
small patch series, instead of spamming a dozen-plus mailing lists,
are probably hundreds of developers, most of whom aren't going to
care about changs in some far flung part of the kernel?

Regards,

						- Ted
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
