Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 543DB987077
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Sep 2024 11:42:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BA5FC78002;
	Thu, 26 Sep 2024 09:42:20 +0000 (UTC)
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C4CECFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 09:42:12 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 3DB5811401E9;
 Thu, 26 Sep 2024 05:42:11 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-10.internal (MEProxy); Thu, 26 Sep 2024 05:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1727343731;
 x=1727430131; bh=Iz/f4ZHWxcDHUsU3hchNxxVI0CA6JwJ/25nEB88OEYc=; b=
 m5CWey+73vWL67jCVJR3EmjZDDiNiCw6MO+Ot1XUWYv5UfyjS8s3pN8TAbLQff25
 Sg6lrqUj15QUnRMNC9xx+OWfhvgvgrksQWBj9T71HyGavK79/2CaQa0kUPqTh7DC
 Fvt6VTvqyu15O2wq2P1yNKc9kYs1KYLNWqvusXnHo+loaICAWCuREXIa0dAhwayW
 dzUsDVdiFBIkIpUPDYOS+MBbIfIgIpzznF12mOowuL5GFdjCASs+wKfoomMiWhwN
 5YOjy90Pt4UmI8r1l6CNvouZkNU3ehNp/5NfSx7fSEgs+Nxpdha1xWTGdlfviajT
 usv+4HhF6PYFGOYEoLiD5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727343731; x=
 1727430131; bh=Iz/f4ZHWxcDHUsU3hchNxxVI0CA6JwJ/25nEB88OEYc=; b=I
 HE1jY+hK5ssV7obuCeyf3Vdk60sSKieOqkFdb5lrwkWZHYABR3YVlRs6krmSEFhR
 q4sSUNNhZbsHn6M2VmRhDf3Z5+MPJKHd8mkW26jIvRkhlwzFTTY1jlGq2olCFpoK
 aWSBwihRg70fnc1s9rjayXphF2frGbXouJWg09xfG7mEc+Kdy8K1gHZyo+ZSTt5r
 e86m+2uanNC+DEvI+o3C3DXeF84aBM79rZ4i/0Fy/t+h3XW/Hv6bhrdLmj7F1BTU
 oewFEEcmhImsDH8zdXehWqQCIFsGSoo53UAFQiHEJkZykxgQK5fdC4c48kS6PUzp
 LswjblX5lMItVKprSRK1Q==
X-ME-Sender: <xms:cSz1Zhtw1sfZrN0_xZrFwtJRo2ly2-IIkoRYRf9XSecslFFW1Yf4Tw>
 <xme:cSz1ZqcZ4Mn_-B479ffF-LvgWpgZ28YanTE9yczZDJSgIjZuifQSHXPL-CQJDm_Ml
 BRD_QTArWMmc59cnzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtjedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
 necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
 guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
 gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfeef
 pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrg
 drfhhrrghnkhgvnhdruggvpdhrtghpthhtohepvhhlrgguihhmihhrrdhmuhhriihinhes
 rghrmhdrtghomhdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsgh
 hrohhuphdrvghupdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhr
 tghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpd
 hrtghpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehj
 tghmvhgskhgstgesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhsthekkeesgh
 hmrghilhdrtghomhdprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:cSz1ZkxOy7rSDphLVTS9LNfuz-xZ0DcXkD6LyC43AmZN667_3xHB2A>
 <xmx:cSz1ZoMK3Ivf8CmyIKLE6hKsYKr-YNbjQG7uuStVPR-pjZccy0tKbQ>
 <xmx:cSz1Zh_wKcXgopX3k4tdeJ6efe46wxmqzIDVda7tQ8Fy8BZtjp_XKA>
 <xmx:cSz1ZoWzEWCkfV0KRcfMRcpDM2Bi9GmS53CNCbQ-fY7gzvdDbHuemw>
 <xmx:cyz1Zi1TkI4jfNUeOagyzusT7o8TNSwRW2Vz9A5SbAkc5TgSR8JAE3m1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 333EE2220071; Thu, 26 Sep 2024 05:42:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 26 Sep 2024 09:41:48 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Helge Deller" <deller@gmx.de>, "Arnd Bergmann" <arnd@kernel.org>,
 linux-mm@kvack.org
Message-Id: <a44eb23a-97cf-4920-8cee-5197754d28f6@app.fastmail.com>
In-Reply-To: <b27eb97b-cb76-4fa8-8b8a-66d3bec655ae@gmx.de>
References: <20240925210615.2572360-1-arnd@kernel.org>
 <20240925210615.2572360-2-arnd@kernel.org>
 <b27eb97b-cb76-4fa8-8b8a-66d3bec655ae@gmx.de>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 Andreas Larsson <andreas@gaisler.com>, Kees Cook <kees@kernel.org>,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Michael Ellerman <mpe@ellerman.id.au>, David Hildenbrand <david@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Christoph Hellwig <hch@lst.de>,
 Matt Turner <mattst88@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Vladimir Murzin <vladimir.murzin@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Vlastimil Babka <vbabka@suse.cz>,
 Christian Brauner <brauner@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 1/5] asm-generic: cosmetic updates to
	uapi/asm/mman.h
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

On Thu, Sep 26, 2024, at 09:21, Helge Deller wrote:
> On 9/25/24 23:06, Arnd Bergmann wrote:

>> -/* not used by linux, but here to make sure we don't clash with OSF/1 defines */
>> -#define _MAP_HASSEMAPHORE 0x0200
>> -#define _MAP_INHERIT	0x0400
>> -#define _MAP_UNALIGNED	0x0800
>
> I suggest to keep ^^ those. It's useful information which isn't
> easily visible otherwise.

Fair enough. I removed them in order to bring the differences
between files to an absolute minimum, but since at the end
of the series the files only contain the map values, there is
no real harm in keeping them, and they may help.

>> -/* not used by linux, but here to make sure we don't clash with ABI defines */
>> -#define MAP_RENAME	0x020		/* Assign page to file */
>> -#define MAP_AUTOGROW	0x040		/* File may grow by writing */
>> -#define MAP_LOCAL	0x080		/* Copy on fork/sproc */
>> -#define MAP_AUTORSRV	0x100		/* Logical swap reserved on demand */
>
> same here. I think they should be preserved.

Right.

>>   /* 0x01 - 0x03 are defined in linux/mman.h */
>> -#define MAP_TYPE	0x00f		/* Mask for type of mapping */
>> -#define MAP_FIXED	0x010		/* Interpret addr exactly */
>> +#define MAP_TYPE	0x0f		/* Mask for type of mapping */
>> +#define MAP_FIXED	0x10		/* Interpret addr exactly */
>>
>> -/* not used by linux, but here to make sure we don't clash with ABI defines */
>> -#define MAP_RENAME	0x020		/* Assign page to file */
>> -#define MAP_AUTOGROW	0x040		/* File may grow by writing */
>> -#define MAP_LOCAL	0x080		/* Copy on fork/sproc */
>> -#define MAP_AUTORSRV	0x100		/* Logical swap reserved on demand */
>
> If xtensa had those, those should be kept as well IMHO.

The thing with xtensa is that the file was blindly copied from
mips, so I'm sure it never had these, but there may be value
in keeping the two files in sync anyway. The only difference
at the moment is MAP_UNINITIALIZED, which is potentially
used on xtensa-nommu.

Let's see if Max Filippov has an opinion on this, otherwise I'd
keep it the same as mips.

      Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
