Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBMSJ14ZsWleqwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 731B325DC7E
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6FDFC90090;
	Wed, 11 Mar 2026 07:27:25 +0000 (UTC)
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86710C0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 11:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
 t=1773143723; bh=LK3zT21XXqhQvbEwg2nItTFGXqZVrRtI29hZHPSW/Rg=;
 h=From:Subject:Date:To:Cc:From;
 b=N680A887D4QfluDnQ9YMDbUv3fMeDgtciZTAs28qE1ZMfDtIvOYgaDmcWZcT7PadE
 NezAv2ULbPqmQCBeFQUon57Nm9sr5Dh3PtHK/kGJ33OcQtAOC3NcovdqFi7gIY5Tsf
 jFvG7eOhk0TIIL5wAyeROiUABQOvWpiwR8WCu1QY=
Received: from [212.42.244.71] (helo=mail.avm.de)
 by mail.avm.de with ESMTP (eXpurgate 4.55.2)
 (envelope-from <phahn-oss@avm.de>)
 id 69b006aa-2367-7f0000032729-7f0000019cac-1
 for <multiple-recipients>; Tue, 10 Mar 2026 12:55:23 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
 by mail.avm.de (Postfix) with ESMTPS;
 Tue, 10 Mar 2026 12:55:22 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:26 +0100
Message-Id: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAsFsGkC/x3M0QpAMBSA4VfRubYaNsyrSIvt4JRGZ5GSd7dcf
 hf//0BEJozQZQ8wXhRpDwlFnoFbx7CgIJ8MpSxrWUktJiUoWmS2O9twbpvQxph2bLysnILUHYw
 z3f+zH973A3+QboxjAAAA
X-Change-ID: 20260305-b4-is_err_or_null-59998a7d03c4
To: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org, 
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev, 
 Philipp Hahn <phahn-oss@avm.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=10360; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=LK3zT21XXqhQvbEwg2nItTFGXqZVrRtI29hZHPSW/Rg=;
 b=kA0DAAoBNC0GU9GsrNsByyZiAGmwBcqh8d5mE3lAkbCCIhk2oWSgNcET++LXgLEGzX+74PInx
 YkBMwQAAQoAHRYhBDls8G2tYNRwNAKmmDQtBlPRrKzbBQJpsAXKAAoJEDQtBlPRrKzbYqsIAK5d
 elvBcseQjOmeiD4mSMAZLrcAEl20R9MpPKd4mWL5ml8BfXxNcML8Lnb2x/WwXL0Hqh2kmn+ol5+
 jwvmVgqFrje1/XM4onDIIomJOYl/rYSo9qoSx+5IKZAy9eiZAEDM2imcIQKtITZKLNjFZpUiemv
 mdOvazQvY2blxW+Lw4Oka7Gqf4ifxsINodUwI5EJjZnPs1AWGammHryjBSpAgbnOjEtCZ7iJAEM
 1l6rZhJZICWoWrt5P/y0CkrMmXMHjvK3or/XW/Oz6/UjFbEuZQMK4Nxx19avU2B1AgjKkKB7gjl
 xFjM+LS1mYwhLw6sC6tDl2dBVLvscyKlify3SXk=
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143723-8DCA3F5F-410B5E4C/0/0
X-purgate-type: clean
X-purgate-size: 10362
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-Mailman-Approved-At: Wed, 11 Mar 2026 07:27:22 +0000
Cc: Latchesar Ionkov <lucho@ionkov.net>, Juri Lelli <juri.lelli@redhat.com>,
 Justin Sanders <justin@coraid.com>, Paulo Alcantara <pc@manguebit.org>,
 Igor Russkikh <irusskikh@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Ben Segall <bsegall@google.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 David Vernet <void@manifault.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Anna Schumaker <anna@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, Long Li <longli@microsoft.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, James Morris <jmorris@namei.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Andrea Righi <arighi@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Shyam Prasad N <sprasad@microsoft.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Potnuri Bharat Teja <bharat@chelsio.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Christian Brauner <brauner@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>,
 Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>,
 Georgi Djakov <djakov@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Trond Myklebust <trondmy@kernel.org>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Sandeep Dhavale <dhavale@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Alasdair Kergon <agk@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Steve French <sfrench@samba.org>, Valentin Schneider <vschneid@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Moore <paul@paul-moore.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Greer <mgreer@animalcreek.com>,
 Gregory Clement <gregory.clement@bootlin.com>, Lee Jones <lee@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Sven Schnelle <svens@linux.ibm.com>,
 Olga Kornievskaia <okorniev@redhat.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Pavel Machek <pavel@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mike Snitzer <snitzer@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Michael Chan <mchan@broadcom.com>,
 Xin Long <lucien.xin@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>, Dave Penkler <dpenkler@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jon Maloy <jmaloy@redhat.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Hongbo Li <lihongbo22@huawei.com>, Simon Horman <horms@kernel.org>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>, Andy Yan <andy.yan@rock-chips.com>,
 Benjamin Marzinski <bmarzins@redhat.com>,
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Taras Chornyi <taras.chornyi@plvision.eu>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Alex Markuze <amarkuze@redhat.com>, Kees Cook <kees@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Alexei Starovoitov <ast@kernel.org>, Chris Mason <clm@fb.com>,
 Eduardo Valentin <edubezval@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chunhai Guo <guochunhai@vivo.com>,
 Will Deacon <will@kernel.org>, Zhi Wang <zhi.wang.linux@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Miklos Szeredi <miklos@szeredi.hu>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Dexuan Cui <decui@microsoft.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Viacheslav Dubeyko <slava@dubeyko.com>,
 Sami Tolvanen <samitolvanen@google.com>, NeilBrown <neil@brown.name>,
 Philipp Zabel <p.zabel@pengutronix.de>, Gao Xiang <xiang@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Petr Pavlu <petr.pavlu@suse.com>, Jonas Karlman <jonas@kwiboo.se>,
 Marcel Holtmann <marcel@holtmann.org>, Jamal Hadi Salim <jhs@mojatatu.com>,
 Steven Rostedt <rostedt@goodmis.org>, Robert Foss <rfoss@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 John Crispin <john@phrozen.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ilya Dryomov <idryomov@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Linus Walleij <linusw@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Aaron Tomlin <atomlin@atomlin.com>, Changwoo Min <changwoo@igalia.com>,
 "David S. Miller" <davem@davemloft.net>, Rich Felker <dalias@libc.org>,
 Jan Kara <jack@suse.cz>, Vignesh Raghavendra <vigneshr@ti.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Alex Williamson <alex@shazbot.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Daniel Gomez <da.gomez@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Russell King <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Yue Hu <zbestahu@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Dai Ngo <Dai.Ngo@oracle.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Thomas Gleixner <tglx@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Heiko Carstens <hca@linux.ibm.com>,
 Chao Yu <chao@kernel.org>, Nicolas Palix <nicolas.palix@imag.fr>,
 Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Phillip Lougher <phillip@squashfs.org.uk>, David Sterba <dsterba@suse.com>,
 Mel Gorman <mgorman@suse.de>, Andreas Gruenbacher <agruenba@redhat.com>,
 Jens Axboe <axboe@kernel.dk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 John Johansen <john.johansen@canonical.com>, Keerthy <j-keerthy@ti.com>,
 David Ahern <dsahern@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Richard Weinberger <richard@nod.at>,
 Paolo Bonzini <pbonzini@redhat.com>, Johannes Berg <johannes@sipsolutions.net>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [Linux-stm32] [PATCH 00/61] treewide: Use IS_ERR_OR_NULL over
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
X-Rspamd-Queue-Id: 731B325DC7E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[avm.de : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[avm.de:s=mail];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[phahn-oss@avm.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:bpf@vger.kernel.org,m:ceph-devel@vger.kernel.org,m:cocci@inria.fr,m:dm-devel@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:gfs2@lists.linux.dev,m:intel-gfx@lists.freedesktop.org,m:intel-wired-lan@lists.osuosl.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-block@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-ext4@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-mm@kvack.org,m:linux-modules@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-phy@l
 ists.infradead.org,m:linux-pm@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-sctp@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-trace-kernel@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:netdev@vger.kernel.org,m:ntfs3@lists.linux.dev,m:samba-technical@lists.samba.org,m:sched-ext@lists.linux.dev,m:target-devel@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:v9fs@lists.linux.dev,m:phahn-oss@avm.de,m:lucho@ionkov.net,m:juri.lelli@redhat.com,m:justin@coraid.com,m:pc@manguebit.org,m:irusskikh@marvell.com,m:andrew@lunn.ch,m:catalin.marinas@arm.com,m:rodrigo.vivi@intel.com,m:ulf.hansson@linaro.org,m:perex@perex.cz,m:bsegall@google.com,m:iyappan@os.amperecomputing.com,m:void@manifault.com,m:miquel.raynal@bootlin.com,m:agordeev@linux.ibm.com,m:kys@microsoft.com,m
 :heiko@sntech.de,m:anna@kernel.org,m:wei.liu@kernel.org,m:vincent.guittot@linaro.org,m:longli@microsoft.com,m:rafael@kernel.org,m:jmorris@namei.org,m:tursulin@ursulin.net,m:arighi@nvidia.com,m:borntraeger@linux.ibm.com,m:sprasad@microsoft.com,m:daniel.lezcano@kernel.org,m:jiri@resnulli.us,m:hawk@kernel.org,m:bharat@chelsio.com,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:ericvh@kernel.org,m:dietmar.eggemann@arm.com,m:brauner@kernel.org,m:sboyd@kernel.org,m:mcgrof@kernel.org,m:chuck.lever@oracle.com,m:mhiramat@kernel.org,m:lukasz.luba@arm.com,m:jack@suse.com,m:tj@kernel.org,m:djakov@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ionkov.net,redhat.com,coraid.com,manguebit.org,marvell.com,lunn.ch,arm.com,intel.com,linaro.org,perex.cz,google.com,os.amperecomputing.com,manifault.com,bootlin.com,linux.ibm.com,microsoft.com,sntech.de,kernel.org,namei.org,ursulin.net,nvidia.com,resnulli.us,chelsio.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,oracle.com,suse.com,linux-foundation.org,samsung.com,linux.intel.com,ffwll.ch,samba.org,zytor.com,paul-moore.com,users.sourceforge.jp,animalcreek.com,amd.com,broadcom.com,mit.edu,rock-chips.com,igalia.com,huawei.com,plvision.eu,baylibre.com,fb.com,ideasonboard.com,vivo.com,iogearbox.net,szeredi.hu,fomichev.me,dubeyko.com,brown.name,pengutronix.de,hallyn.com,kwiboo.se,holtmann.org,mojatatu.com,goodmis.org,efficios.com,phrozen.org,alpha.franken.de,inria.fr,atomlin.com,davemloft.net,libc.org,suse.cz,ti.com,infradead.org,codewreck.org,crudebyte.com,paragon-software.com,shazbot.org,dilger.ca,alien8.de,armlinux.org.uk,8bytes.org,linuxfoundation.org,imag.fr,
 talpey.com,squashfs.org.uk,suse.de,kernel.dk,canonical.com,linux.alibaba.com,nod.at,sipsolutions.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[247];
	NEURAL_HAM(-0.00)[-0.834];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[phahn-oss@avm.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[avm.de:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[avm.de:mid,avm.de:email]
X-Rspamd-Action: no action

While doing some static code analysis I stumbled over a common pattern,
where IS_ERR() is combined with a NULL check. For that there is
IS_ERR_OR_NULL().

I've written a Coccinelle patch to find and patch those instances.
The patches follow grouped by subsystem.

Patches 55-58 may be dropped as they have a (minor?) semantic change:
They use WARN_ON() or WARN_ON_ONCE(), but only in the IS_ERR() path, not
for the NULL check. Iff it is okay to print the warning also for NULL,
then the patches can be applied.

While generating the patch set `checkpatch` complained about mixing
[un]likely() with IS_ERR_OR_NULL(), which already uses likely()
internally. I found and fixed several locations, where that combination
has been used.

Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
Philipp Hahn (61):
      Coccinelle: Prefer IS_ERR_OR_NULL over manual NULL check
      btrfs: Prefer IS_ERR_OR_NULL over manual NULL check
      ceph: Prefer IS_ERR_OR_NULL over manual NULL check
      ext4: Prefer IS_ERR_OR_NULL over manual NULL check
      smb: Prefer IS_ERR_OR_NULL over manual NULl check
      9p: Prefer IS_ERR_OR_NULL over manual NULL check
      erofs: Prefer IS_ERR_OR_NULL over manual NULL check
      fuse: Prefer IS_ERR_OR_NULL over manual NULL check
      ntfs3: Prefer IS_ERR_OR_NULL over manual NULL check
      gfs2: Prefer IS_ERR_OR_NULL over manual NULL check
      pstore: Prefer IS_ERR_OR_NULL over manual NULL check
      quota: Prefer IS_ERR_OR_NULL over manual NULL check
      squashfs: Prefer IS_ERR_OR_NULL over manual NULL check
      seq_file: Prefer IS_ERR_OR_NULL over manual NULL check
      trace: Prefer IS_ERR_OR_NULL over manual NULL check
      sched: Prefer IS_ERR_OR_NULL over manual NULL check
      module: Prefer IS_ERR_OR_NULL over manual NULL check
      sound: Prefer IS_ERR_OR_NULL over manual NULL check
      kvm: Prefer IS_ERR_OR_NULL over manual NULL check
      apparmor: Prefer IS_ERR_OR_NULL over manual NULL check
      lib/test: Prefer IS_ERR_OR_NULL over manual NULL check
      md: Prefer IS_ERR_OR_NULL over manual NULL check
      net/ipv6: Prefer IS_ERR_OR_NULL over manual NULL check
      net/9p: Prefer IS_ERR_OR_NULL over manual NULL check
      net/bluetooth: Prefer IS_ERR_OR_NULL over manual NULL check
      net/core: Prefer IS_ERR_OR_NULL over manual NULL check
      net/netlink: Prefer IS_ERR_OR_NULL over manual NULL check
      net/sched: Prefer IS_ERR_OR_NULL over manual NULL check
      net/sctp: Prefer IS_ERR_OR_NULL over manual NULL check
      net/sunrpc: Prefer IS_ERR_OR_NULL over manual NULL check
      net/tipc: Prefer IS_ERR_OR_NULL over manual NULL check
      net/wireless: Prefer IS_ERR_OR_NULL over manual NULL check
      mm: Prefer IS_ERR_OR_NULL over manual NULL check
      arch/arm: Prefer IS_ERR_OR_NULL over manual NULL check
      arch/mips: Prefer IS_ERR_OR_NULL over manual NULL check
      arch/sh: Prefer IS_ERR_OR_NULL over manual NULL check
      drm: Prefer IS_ERR_OR_NULL over manual NULL check
      net: Prefer IS_ERR_OR_NULL over manual NULL check
      irqchip: Prefer IS_ERR_OR_NULL over manual NULL check
      phy: Prefer IS_ERR_OR_NULL over manual NULL check
      pinctrl: Prefer IS_ERR_OR_NULL over manual NULL check
      pmdomain: Prefer IS_ERR_OR_NULL over manual NULL check
      s390: Prefer IS_ERR_OR_NULL over manual NULL check
      target: Prefer IS_ERR_OR_NULL over manual NULL check
      thermal: Prefer IS_ERR_OR_NULL over manual NULL check
      vfio: Prefer IS_ERR_OR_NULL over manual NULL check
      nfc: Prefer IS_ERR_OR_NULL over manual NULL check
      mtd: Prefer IS_ERR_OR_NULL over manual NULL check
      media: Prefer IS_ERR_OR_NULL over manual NULL check
      iommu: Prefer IS_ERR_OR_NULL over manual NULL check
      leds: Prefer IS_ERR_OR_NULL over manual NULL check
      gpib: Prefer IS_ERR_OR_NULL over manual NULL check
      hyperv: Prefer IS_ERR_OR_NULL over manual NULL check
      aoe: Prefer IS_ERR_OR_NULL over manual NULL check
      interconnect: Prefer IS_ERR_OR_NULL over manual NULL check
      clk: Prefer IS_ERR_OR_NULL over manual NULL check
      reset: Prefer IS_ERR_OR_NULL over manual NULL check
      arch/x86: Prefer IS_ERR_OR_NULL over manual NULL check
      debugobjects: Drop likely() around !IS_ERR_OR_NULL()
      Input alps: Drop unlikely() around IS_ERR_OR_NULL()
      file: Drop unlikely() around IS_ERR_OR_NULL()

 arch/arm/common/bL_switcher.c                      |   2 +-
 arch/mips/lantiq/clk.c                             |   2 +-
 arch/sh/mm/ioremap.c                               |   2 +-
 arch/x86/kernel/callthunks.c                       |   2 +-
 arch/x86/kernel/irq.c                              |   2 +-
 drivers/block/aoe/aoecmd.c                         |   2 +-
 drivers/clk/clk.c                                  |   4 +-
 drivers/clocksource/timer-pxa.c                    |   2 +-
 drivers/gpib/common/iblib.c                        |   2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   2 +-
 drivers/gpu/drm/drm_sysfs.c                        |   2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |   4 +-
 drivers/gpu/drm/radeon/radeon_test.c               |   2 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |   2 +-
 drivers/hv/mshv_eventfd.c                          |   4 +-
 drivers/input/mouse/alps.c                         |   2 +-
 drivers/interconnect/core.c                        |   2 +-
 drivers/iommu/omap-iommu.c                         |   2 +-
 drivers/irqchip/irq-gic-v3.c                       |   2 +-
 drivers/irqchip/irq-mvebu-odmi.c                   |   2 +-
 drivers/leds/trigger/ledtrig-tty.c                 |   2 +-
 drivers/md/dm-cache-metadata.c                     |   2 +-
 drivers/md/dm-crypt.c                              |   4 +-
 drivers/media/test-drivers/vimc/vimc-streamer.c    |   2 +-
 drivers/mtd/nand/raw/gpio.c                        |  10 +-
 drivers/net/ethernet/aquantia/atlantic/aq_ring.c   |   2 +-
 drivers/net/ethernet/broadcom/tg3.c                |   2 +-
 .../net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c   |   3 +-
 drivers/net/ethernet/intel/ice/devlink/devlink.c   |   2 +-
 .../ethernet/marvell/prestera/prestera_router.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   2 +-
 drivers/net/mdio/mdio-xgene.c                      |   2 +-
 drivers/net/usb/r8152.c                            |   2 +-
 drivers/nfc/trf7970a.c                             |   2 +-
 drivers/phy/phy-core.c                             |   2 +-
 drivers/pinctrl/core.c                             |   2 +-
 drivers/pmdomain/rockchip/pm-domains.c             |   2 +-
 drivers/reset/core.c                               |   2 +-
 drivers/s390/char/tape_class.c                     |   2 +-
 drivers/target/target_core_fabric_configfs.c       |   6 +-
 drivers/thermal/ti-soc-thermal/ti-thermal-common.c |   2 +-
 drivers/vfio/vfio_main.c                           |   2 +-
 fs/9p/fid.h                                        |   2 +-
 fs/btrfs/inode.c                                   |   2 +-
 fs/btrfs/transaction.c                             |   2 +-
 fs/btrfs/tree-log.c                                |   2 +-
 fs/btrfs/uuid-tree.c                               |   2 +-
 fs/ceph/dir.c                                      |   2 +-
 fs/ceph/snap.c                                     |   2 +-
 fs/erofs/zdata.c                                   |   2 +-
 fs/ext4/fast_commit.c                              |   2 +-
 fs/ext4/mballoc.c                                  |   2 +-
 fs/ext4/namei.c                                    |   2 +-
 fs/ext4/symlink.c                                  |   2 +-
 fs/fuse/dir.c                                      |   2 +-
 fs/gfs2/glock.c                                    |   2 +-
 fs/ntfs3/fsntfs.c                                  |   8 +-
 fs/pstore/zone.c                                   |   2 +-
 fs/quota/quota.c                                   |   2 +-
 fs/seq_file.c                                      |   4 +-
 fs/smb/client/cifsglob.h                           |   2 +-
 fs/smb/client/connect.c                            |   2 +-
 fs/smb/client/readdir.c                            |   2 +-
 fs/squashfs/cache.c                                |   2 +-
 include/linux/file.h                               |   2 +-
 include/net/9p/client.h                            |   2 +-
 kernel/module/main.c                               |   2 +-
 kernel/sched/ext.c                                 |   2 +-
 kernel/trace/fprobe.c                              |   2 +-
 kernel/trace/kprobe_event_gen_test.c               |   2 +-
 kernel/trace/trace_events_hist.c                   |   2 +-
 lib/debugobjects.c                                 |   2 +-
 lib/test_firmware.c                                |   2 +-
 lib/test_kmod.c                                    |   4 +-
 mm/kmemleak.c                                      |  16 +--
 net/9p/trans_rdma.c                                |   8 +-
 net/bluetooth/mgmt.c                               |   6 +-
 net/core/xdp.c                                     |   2 +-
 net/ipv6/ila/ila_xlat.c                            |   2 +-
 net/ipv6/ndisc.c                                   |   2 +-
 net/netlink/af_netlink.c                           |   2 +-
 net/sched/cls_api.c                                |   6 +-
 net/sctp/socket.c                                  |   2 +-
 net/sunrpc/xprtrdma/svc_rdma_transport.c           |  12 +-
 net/tipc/socket.c                                  |   2 +-
 net/wireless/reg.c                                 |   2 +-
 scripts/coccinelle/api/is_err_or_null.cocci        | 125 +++++++++++++++++++++
 security/apparmor/apparmorfs.c                     |   2 +-
 sound/soc/samsung/i2s.c                            |   4 +-
 sound/soc/xtensa/xtfpga-i2s.c                      |   2 +-
 virt/kvm/eventfd.c                                 |   4 +-
 91 files changed, 251 insertions(+), 127 deletions(-)
---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260305-b4-is_err_or_null-59998a7d03c4

Best regards,
-- 
Philipp Hahn <phahn-oss@avm.de>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
