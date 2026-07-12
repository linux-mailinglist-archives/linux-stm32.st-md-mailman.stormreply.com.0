Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hGxGMU90U2p4bAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Jul 2026 13:02:39 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7DA74471C
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Jul 2026 13:02:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=arndb.de header.s=fm1 header.b=zpHRfiC5;
	dkim=fail ("body hash did not verify") header.d=messagingengine.com header.s=fm2 header.b="l 6PtvRh";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=arndb.de (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87BBBC5A4EF;
	Sun, 12 Jul 2026 11:02:38 +0000 (UTC)
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2B7EC56600
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jul 2026 11:02:37 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id B209314000F9;
 Sun, 12 Jul 2026 07:02:36 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
 by phl-compute-04.internal (MEProxy); Sun, 12 Jul 2026 07:02:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1783854156;
 x=1783940556; bh=VmtnK3tqoDU1aIaol+aWaActTb6DTRuQA5S8IlUXC6U=; b=
 zpHRfiC5EPwl520ahCHYKKw5slNvnULR9f0KFrRT9y/2496pQCwk5KRBRbFgaYwK
 qG5F+qyc+u6zQHl69ceJPRiSScFtXeE7ZyRSVgJSuprmdrpegDBkSA7FMJ5iWHIW
 SWlwkvdzIryhehvQjfxl6CaW2ssS7P7s2gf6gPSaRBitFcji6E7w6O+D9MGOTq8e
 KhN1cpA/Tqcli21P3rrlWr0Xxua3FpQ5R7OFYe9FPdjPs6R+VvBCiyDkT0HtPl2f
 qii8ZEdh5SWDrMrxQFPHLV29au4QVk00LL5Ct/0KCqib5HX/6aJG4Up8UlRvgkJY
 nRorXxeir3laErJG81MisA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783854156; x=
 1783940556; bh=VmtnK3tqoDU1aIaol+aWaActTb6DTRuQA5S8IlUXC6U=; b=l
 6PtvRhdAV0qi2d8e9JUkK2fFLlwxNVY88bcJ+5Aj5gdngpmAYCMSgprFJ8wo710r
 L3GX7fLDfky6/oZ5HVFMbvr3LfslQE3A4w7QmId8Pn6hgVlensKX8wbHDxXJXMEw
 ljaGdMaWuSttqpLIh1kRGvTz2JKn9ccjs3FegrO0y+RbRlkAzKbQ2dqj069GeO+7
 KiNB7ReoNHH0ZUF3RSAIMtQSTjbO3t+zGQmSf4gQWGO8/uy+Wvbs6Xl2gDkoDMV7
 CmCc8Ljjg46b8emiC9vxMTJkV1Aw2OeUhRq5fNYVA+WvlRG7ZcpAMzEUPYx0xvod
 o+8ewgiMwgBexztrVjN5Q==
X-ME-Sender: <xms:SXRTar8WT3jXuGcKhip6v_oZ_ev_MYJ3TiCDPsHDGOy_4qyk61nOpA>
 <xme:SXRTaigdv70_fhLJe4evVFXvY38h-PROEIkCw6nfAYtcRrN4q0volhQFULkdIqZ6L
 z8_glaP7Vjxtth72FHcVVja1cD22b3GdPb5JUl06P7cs54F9UBgiclm>
X-ME-Proxy-Cause: dmFkZTGLo78njPg/nVe+uHWg3AzWojEtguj4DH8KNv19gE9YnhOLAIWMCTf4qhQuAaKC9P
 oqyQsM8pSAEKHb797BqDSo1aNsM3rLblcv7PG7RotKu6L/VmYg2dW8zs2GiGwBQBqITK1u
 X7zWoJgFJCv+6+BhbAHafVgja8Z3pTN2uEr2UPDO/nE22eQsOCXiJJSQPkNMNg99Cf35b5
 J+tdL50vwyZ/VB0b7S4W+UsY7ZTc+cfBHJYz0U/kX691quZfggwKD0RgbG/U6czrjHfrvF
 6fq/4yXwXeSj8YJFVVakjVNKSPD+23ViVy8tbJNIxUaNcajIR7AH0T/de5rCVSDzK344tx
 U0x24Up+ufBa9p+NAvwC4cO2T9HS+kz0KnK//dY/mOxOe/QpD8tgteUxcBF++TLDigfVC1
 C3EJFOtWxRFUioYMCn8qg0rQx+yCJX0thmaTY7UEVDucc/9mhpzue03w8Dp+CxjgmXdcGu
 RSCzsnIT3+hEirvAmIyFtq70pAE1IonG2VSteXv8IfwRKlnb463XanbbZobuFZ9GMPY1GC
 8nsnv82zjPtzkRalpSto4MmL5kHeehrV6iIR1EmzKUc5FkQFY5TKbxBu61Nz8jJ7suNzU3
 Cyvv5MNgqU18rt3jpb2tgZMGlm2/SgzvbBaj3jXxb82AJ7qi2ot7EKTwTDoQ
X-ME-Proxy: <xmx:SXRTapHAhWRiFbB-4amYjFgmwydjtOdojLMQlh0VZZlQEErKhomHig>
 <xmx:SXRTaoKLDK9Ecbgry1ger4QfqGLLQ1xOkTzua4qZzvVI-kaPbzgKWw>
 <xmx:SXRTap8dLyvqloUGHlP29AnEVqPiM2OIYq0126wYr_cBo0x_TFVHVA>
 <xmx:SXRTaqegpYaBne9K3glgOErxceihkfr_b7_lWpHaESTvei9pJ8qgGA>
 <xmx:THRTagApbQu8pd3LegvnC51UZb7KkVStZc2jhlRfHD_OxzYfyYsDaYFF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 29B00182007E; Sun, 12 Jul 2026 07:02:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ARmmoW1aQeCk
Date: Sun, 12 Jul 2026 13:01:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Fernando Fernandez Mancera" <fmancera@suse.de>,
 Netdev <netdev@vger.kernel.org>
Message-Id: <12ffac6a-649a-4e4a-8d12-0b48171e1d95@app.fastmail.com>
In-Reply-To: <20260712013941.4570-2-fmancera@suse.de>
References: <20260712013941.4570-1-fmancera@suse.de>
 <20260712013941.4570-2-fmancera@suse.de>
Cc: linux-sctp@vger.kernel.org, Tony Lu <tonylu@linux.alibaba.com>,
 Christoph Hellwig <hch@lst.de>, Eelco Chaudron <echaudro@redhat.com>,
 Xin Long <lucien.xin@gmail.com>, Geliang Tang <geliang@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Eric Biggers <ebiggers@kernel.org>, Nilesh Javali <njavali@marvell.com>,
 Bhargava Marreddy <bhargava.marreddy@broadcom.com>,
 Arend van Spriel <arend.vanspriel@broadcom.com>, Phil Sutter <phil@nwl.cc>,
 Jiri Pirko <jiri@resnulli.us>, Vikas Gupta <vikas.gupta@broadcom.com>,
 Aaron Conole <aconole@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Petr Machata <petrm@nvidia.com>, Christian Brauner <brauner@kernel.org>,
 Saurav Kashyap <skashyap@marvell.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 b.a.t.m.a.n@lists.open-mesh.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Varun Prakash <varun@chelsio.com>,
 GR-QLogic-Storage-Upstream@marvell.com, Wen Gu <guwen@linux.alibaba.com>,
 linux-fsdevel@vger.kernel.org, Elad Nachman <enachman@marvell.com>,
 Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>,
 Trond Myklebust <trondmy@kernel.org>, linux-wireless@vger.kernel.org,
 Sidraya Jayagond <sidraya@linux.ibm.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Eric Dumazet <edumazet@google.com>, target-devel@vger.kernel.org,
 Anthony L Nguyen <anthony.l.nguyen@intel.com>, dev@openvswitch.org,
 linux-s390@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>,
 Leon Romanovsky <leon@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Ilya Maximets <i.maximets@ovn.org>, Mat Martineau <martineau@kernel.org>,
 Julian Anastasov <ja@ssi.bg>, coreteam@netfilter.org,
 Antonio Quartulli <antonio@mandelbit.com>, netfilter-devel@vger.kernel.org,
 Olga Kornievskaia <okorniev@redhat.com>, Ido Schimmel <idosch@nvidia.com>,
 Wenjia Zhang <wenjia@linux.ibm.com>, Nicolai Buchwitz <nb@tipi-net.de>,
 Chen-Yu Tsai <wens@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Julian Braha <julianbraha@gmail.com>, Florian Westphal <fw@strlen.de>,
 brcm80211@lists.linux.dev, Tariq Toukan <tariqt@nvidia.com>,
 Jon Maloy <jmaloy@redhat.com>, Anna Schumaker <anna@kernel.org>,
 Chuck Lever <cel@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Nikolay Aleksandrov <razor@blackwall.org>, Javed Hasan <jhasan@marvell.com>,
 Dmitry Safonov <0x7f454c46@gmail.com>, linux-nvme@lists.infradead.org,
 "open list:NETRONOME ETHERNET DRIVERS" <oss-drivers@corigine.com>,
 Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
 Sven Eckelmann <sven@narfation.org>, lvs-devel@vger.kernel.org,
 Sagi Grimberg <sagi@grimberg.me>, linux-rdma@vger.kernel.org,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <me@ziyao.cc>,
 NeilBrown <neil@brown.name>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 "open list:ETHERNET BRIDGE" <bridge@lists.linux.dev>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Keith Busch <kbusch@kernel.org>, Allison Henderson <achender@kernel.org>,
 mptcp@lists.linux.dev, linux-nfs@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Inochi Amaoto <inochiama@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 Joey Lu <a0987203069@gmail.com>, Edward Cree <ecree.xilinx@gmail.com>,
 "D. Wythe" <alibuda@linux.alibaba.com>,
 Qingfang Deng <qingfang.deng@linux.dev>,
 Manish Rangankar <mrangankar@marvell.com>,
 "David S . Miller" <davem@davemloft.net>, Jan Kara <jack@suse.cz>,
 Mark Bloch <mbloch@nvidia.com>, Justin Chen <justin.chen@broadcom.com>,
 David Howells <dhowells@redhat.com>, Matthieu Baerts <matttbe@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Marek Lindner <marek.lindner@mailbox.org>, rds-devel@oss.oracle.com,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Florian Fainelli <florian.fainelli@broadcom.com>, linux-net-drivers@amd.com,
 Dai Ngo <Dai.Ngo@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dust Li <dust.li@linux.alibaba.com>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 Mahanta Jambigi <mjambigi@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 Chaitanya Kulkarni <kch@nvidia.com>, Simon Horman <horms@kernel.org>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Tom Talpey <tom@talpey.com>, Alyssa Ross <hi@alyssa.is>,
 Jens Axboe <axboe@kernel.dk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 brcm80211-dev-list.pdl@broadcom.com, linux-scsi@vger.kernel.org,
 Simon Wunderlich <sw@simonwunderlich.de>, David Ahern <dsahern@kernel.org>,
 "open list:TIPC NETWORK LAYER" <tipc-discussion@lists.sourceforge.net>,
 Johannes Berg <johannes@sipsolutions.net>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Saeed Mahameed <saeedm@nvidia.com>
Subject: Re: [Linux-stm32] [PATCH 01/13 RFC net-next] net: ipv4: introduce
 CONFIG_IPV4 to decouple the IPv4 stack
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.40 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arndb.de : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fmancera@suse.de,m:netdev@vger.kernel.org,m:linux-sctp@vger.kernel.org,m:tonylu@linux.alibaba.com,m:hch@lst.de,m:echaudro@redhat.com,m:lucien.xin@gmail.com,m:geliang@kernel.org,m:maxime.chevallier@bootlin.com,m:ebiggers@kernel.org,m:njavali@marvell.com,m:bhargava.marreddy@broadcom.com,m:arend.vanspriel@broadcom.com,m:phil@nwl.cc,m:jiri@resnulli.us,m:vikas.gupta@broadcom.com,m:aconole@redhat.com,m:viro@zeniv.linux.org.uk,m:petrm@nvidia.com,m:brauner@kernel.org,m:skashyap@marvell.com,m:gregkh@linuxfoundation.org,m:b.a.t.m.a.n@lists.open-mesh.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:varun@chelsio.com,m:GR-QLogic-Storage-Upstream@marvell.com,m:guwen@linux.alibaba.com,m:linux-fsdevel@vger.kernel.org,m:enachman@marvell.com,m:rajashekar.hudumula@broadcom.com,m:trondmy@kernel.org,m:linux-wireless@vger.kernel.org,m:sidraya@linux.ibm.com,m:James.Bottomley@hansenpartnership.com,m:edumazet@google.com,m:target-devel@vger.kernel.org
 ,m:anthony.l.nguyen@intel.com,m:dev@openvswitch.org,m:linux-s390@vger.kernel.org,m:kuniyu@google.com,m:leon@kernel.org,m:andrew+netdev@lunn.ch,m:i.maximets@ovn.org,m:martineau@kernel.org,m:ja@ssi.bg,m:coreteam@netfilter.org,m:antonio@mandelbit.com,m:netfilter-devel@vger.kernel.org,m:okorniev@redhat.com,m:idosch@nvidia.com,m:wenjia@linux.ibm.com,m:nb@tipi-net.de,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:julianbraha@gmail.com,m:fw@strlen.de,m:brcm80211@lists.linux.dev,m:tariqt@nvidia.com,m:jmaloy@redhat.com,m:anna@kernel.org,m:cel@kernel.org,m:hkallweit1@gmail.com,m:miriam.rachel.korenblit@intel.com,m:marcelo.leitner@gmail.com,m:razor@blackwall.org,m:jhasan@marvell.com,m:0x7f454c46@gmail.com,m:linux-nvme@lists.infradead.org,m:oss-drivers@corigine.com,m:marc.dionne@auristor.com,m:linux-afs@lists.infradead.org,m:sven@narfation.org,m:lvs-devel@vger.kernel.org,m:sagi@grimberg.me,m:linux-rdma@vger.kernel.org,m:przemyslaw.kitszel@intel.com,m:krzk@kernel.org,m:siyanteng@cqso
 ftware.com.cn,m:me@ziyao.cc,m:neil@brown.name,m:pabeni@redhat.com,m:pablo@netfilter.org,m:bridge@lists.linux.dev,m:jhs@mojatatu.com,m:rmk+kernel@armlinux.org.uk,m:kbusch@kernel.org,m:achender@kernel.org,m:mptcp@lists.linux.dev,m:linux-nfs@vger.kernel.org,m:martin.petersen@oracle.com,m:inochiama@gmail.com,m:jlayton@kernel.org,m:a0987203069@gmail.com,m:ecree.xilinx@gmail.com,m:alibuda@linux.alibaba.com,m:qingfang.deng@linux.dev,m:mrangankar@marvell.com,m:davem@davemloft.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[arnd@arndb.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.alibaba.com,lst.de,redhat.com,gmail.com,kernel.org,bootlin.com,marvell.com,broadcom.com,nwl.cc,resnulli.us,zeniv.linux.org.uk,nvidia.com,linuxfoundation.org,lists.open-mesh.org,st-md-mailman.stormreply.com,chelsio.com,linux.ibm.com,hansenpartnership.com,google.com,intel.com,openvswitch.org,lunn.ch,ovn.org,ssi.bg,netfilter.org,mandelbit.com,tipi-net.de,lists.infradead.org,strlen.de,lists.linux.dev,blackwall.org,corigine.com,auristor.com,narfation.org,grimberg.me,cqsoftware.com.cn,ziyao.cc,brown.name,mojatatu.com,armlinux.org.uk,oracle.com,linux.dev,davemloft.net,suse.cz,secunet.com,mailbox.org,oss.oracle.com,eswincomputing.com,gondor.apana.org.au,amd.com,ziepe.ca,lists.osuosl.org,bp.renesas.com,talpey.com,alyssa.is,kernel.dk,simonwunderlich.de,lists.sourceforge.net,sipsolutions.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:-,messagingengine.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCPT_COUNT_GT_50(0.00)[133];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,arndb.de:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo,app.fastmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA7DA74471C

On Sun, Jul 12, 2026, at 03:38, Fernando Fernandez Mancera wrote:
> Historically, the IPv4 protocol has been linked to the core INET
> subsystem. Because shared infrastructure like the TCP/UDP engine,
> routing or INET hashtables live inside net/ipv4/, it has been impossible
> to compile a kernel with only IPv6 support.
>
> This patch introduces the CONFIG_IPV4 Kconfig symbol, which is set to
> 'def_bool y' for now. This does not allow to completely disable the
> IPv4 stack yet but it lays the necessary build-system work for that
> goal.

I expect this will cause additional (trivial) build regression in the
next step when randconfig builds run into obscure corner cases, either
with INET=y IPV4=n IPV6=y or with INET=y IPV4=n IPV6=n.

I can probably give your patch (with IPV4 visible or disabled) an
early go on the randconfig tree to find these more quickly.
If I run into regressions, should I just add more 'depends on IPV4',
or do you have other plans?

Should we have some logic to ensure that at least one of IPV4 or
IPV6 is enabled? I think this would work

config IPV4
      bool "The IPv4 protocol" if IPV6
      default INET

which only allows turning IPV4 off if IPV6 has enabled.

       Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
