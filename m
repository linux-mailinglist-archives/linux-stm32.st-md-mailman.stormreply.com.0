Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5B6B9BFF9
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Sep 2025 22:32:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CCF0C3F943;
	Wed, 24 Sep 2025 20:32:06 +0000 (UTC)
Received: from fra-out-009.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 (fra-out-009.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 [3.64.237.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 984CCC3F942
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 20:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
 t=1758745925; x=1790281925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fgKTaT7jj0zRx6jbQ7DJOMsaZramokk9q66dhz8aLl4=;
 b=LxjMzoMOZv0oNl47KrnMRwe01BtyxI1P6JAyPUQiNT4MJmPmGu6K8mx5
 YUjEBZ8DfdFtNXLVqHSz1wbJXNi9qLGuabIsePbpYIa3WcH0AD8f517qB
 TCPyukrK4Z4rh1jNM42k3H6q91WY+p4CHC8+SNtpWxXhRvPDzf7Atm5/N
 x931H5asjUJ5h+8VgMHwF1AbIttpPi5tNgeC/ifUcg4Zo5o0xxkcRjEZy
 0vYtooYXRoFNYkK03jZ2YBNLfzNreqOYq4cdprb9jxbB9RB2SgNTqSP/w
 xYWx4qX56t0E314E7Op/uu56fLeKinzLq5eQ6FUMLDXzsVP051Hgf0gI0 Q==;
X-CSE-ConnectionGUID: 2CEhoLgVTqullHJPeNHiCg==
X-CSE-MsgGUID: reczyUXmQ7qpBKCYdBCVRg==
X-IronPort-AV: E=Sophos;i="6.18,291,1751241600"; 
   d="scan'208";a="2531827"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO
 smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
 by internal-fra-out-009.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 20:32:05 +0000
Received: from EX19MTAEUB002.ant.amazon.com [54.240.197.224:13400]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.10.226:2525]
 with esmtp (Farcaster)
 id fcd5402e-3c7b-443d-a8ef-25b2e4a26559; Wed, 24 Sep 2025 20:32:04 +0000 (UTC)
X-Farcaster-Flow-ID: fcd5402e-3c7b-443d-a8ef-25b2e4a26559
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Wed, 24 Sep 2025 20:32:01 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D018EUA004.ant.amazon.com (10.252.50.85) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Wed, 24 Sep 2025
 20:31:26 +0000
From: Eliav Farber <farbere@amazon.com>
To: <linux@armlinux.org.uk>, <richard@nod.at>,
 <anton.ivanov@cambridgegreys.com>, <johannes@sipsolutions.net>,
 <dave.hansen@linux.intel.com>, <luto@kernel.org>, <peterz@infradead.org>,
 <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <x86@kernel.org>,
 <hpa@zytor.com>, <tony.luck@intel.com>, <qiuxu.zhuo@intel.com>,
 <mchehab@kernel.org>, <james.morse@arm.com>, <rric@kernel.org>,
 <harry.wentland@amd.com>, <sunpeng.li@amd.com>, <Rodrigo.Siqueira@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <evan.quan@amd.com>, <james.qian.wang@arm.com>, <liviu.dudau@arm.com>,
 <mihail.atanassov@arm.com>, <brian.starkey@arm.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>, <jdelvare@suse.com>,
 <linux@roeck-us.net>, <linus.walleij@linaro.org>,
 <dmitry.torokhov@gmail.com>, <maz@kernel.org>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <agk@redhat.com>,
 <snitzer@kernel.org>, <dm-devel@redhat.com>, <rajur@chelsio.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <peppe.cavallaro@st.com>,
 <alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
 <mcoquelin.stm32@gmail.com>, <krzysztof.kozlowski@linaro.org>,
 <malattia@linux.it>, <hdegoede@redhat.com>, <markgross@kernel.org>,
 <artur.paszkiewicz@intel.com>, <jejb@linux.ibm.com>,
 <martin.petersen@oracle.com>, <sakari.ailus@linux.intel.com>,
 <gregkh@linuxfoundation.org>, <fei1.li@intel.com>, <clm@fb.com>,
 <josef@toxicpanda.com>, <dsterba@suse.com>, <jack@suse.com>, <tytso@mit.edu>, 
 <adilger.kernel@dilger.ca>, <dushistov@mail.ru>,
 <luc.vanoostenryck@gmail.com>, <rostedt@goodmis.org>, <mhiramat@kernel.org>,
 <pmladek@suse.com>, <senozhatsky@chromium.org>,
 <andriy.shevchenko@linux.intel.com>, <linux@rasmusvillemoes.dk>,
 <minchan@kernel.org>, <ngupta@vflare.org>, <akpm@linux-foundation.org>,
 <yoshfuji@linux-ipv6.org>, <dsahern@kernel.org>, <pablo@netfilter.org>,
 <kadlec@netfilter.org>, <fw@strlen.de>, <jmaloy@redhat.com>,
 <ying.xue@windriver.com>, <andrii@kernel.org>, <mykolal@fb.com>,
 <ast@kernel.org>, <daniel@iogearbox.net>, <martin.lau@linux.dev>,
 <song@kernel.org>, <yhs@fb.com>, <john.fastabend@gmail.com>,
 <kpsingh@kernel.org>, <sdf@google.com>, <haoluo@google.com>,
 <jolsa@kernel.org>, <shuah@kernel.org>, <keescook@chromium.org>,
 <wad@chromium.org>, <willy@infradead.org>, <farbere@amazon.com>,
 <sashal@kernel.org>, <ruanjinjie@huawei.com>, <quic_akhilpo@quicinc.com>,
 <David.Laight@ACULAB.COM>, <herve.codina@bootlin.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-um@lists.infradead.org>, <linux-edac@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <linux-hwmon@vger.kernel.org>, <linux-input@vger.kernel.org>,
 <linux-sunxi@lists.linux.dev>, <linux-media@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-btrfs@vger.kernel.org>,
 <linux-ext4@vger.kernel.org>, <linux-sparse@vger.kernel.org>,
 <linux-mm@kvack.org>, <netfilter-devel@vger.kernel.org>,
 <coreteam@netfilter.org>, <tipc-discussion@lists.sourceforge.net>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <stable@vger.kernel.org>
Date: Wed, 24 Sep 2025 20:23:13 +0000
Message-ID: <20250924202320.32333-13-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250924202320.32333-1-farbere@amazon.com>
References: <20250924202320.32333-1-farbere@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D033UWA001.ant.amazon.com (10.13.139.103) To
 EX19D018EUA004.ant.amazon.com (10.252.50.85)
Cc: Arnd Bergmann <arnd@kernel.org>, David Laight <David.Laight@aculab.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [Linux-stm32] [PATCH 12/19 v6.1.y] minmax: fix up min3() and max3()
	too
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

From: Linus Torvalds <torvalds@linux-foundation.org>

[ Upstream commit 21b136cc63d2a9ddd60d4699552b69c214b32964 ]

David Laight pointed out that we should deal with the min3() and max3()
mess too, which still does excessive expansion.

And our current macros are actually rather broken.

In particular, the macros did this:

  #define min3(x, y, z) min((typeof(x))min(x, y), z)
  #define max3(x, y, z) max((typeof(x))max(x, y), z)

and that not only is a nested expansion of possibly very complex
arguments with all that involves, the typing with that "typeof()" cast
is completely wrong.

For example, imagine what happens in max3() if 'x' happens to be a
'unsigned char', but 'y' and 'z' are 'unsigned long'.  The types are
compatible, and there's no warning - but the result is just random
garbage.

No, I don't think we've ever hit that issue in practice, but since we
now have sane infrastructure for doing this right, let's just use it.
It fixes any excessive expansion, and also avoids these kinds of broken
type issues.

Requested-by: David Laight <David.Laight@aculab.com>
Acked-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 include/linux/minmax.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/linux/minmax.h b/include/linux/minmax.h
index 41da6f85a407..98008dd92153 100644
--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -152,13 +152,20 @@
 #define umax(x, y)	\
 	__careful_cmp(max, (x) + 0u + 0ul + 0ull, (y) + 0u + 0ul + 0ull)
 
+#define __careful_op3(op, x, y, z, ux, uy, uz) ({			\
+	__auto_type ux = (x); __auto_type uy = (y);__auto_type uz = (z);\
+	BUILD_BUG_ON_MSG(!__types_ok3(x,y,z,ux,uy,uz),			\
+		#op"3("#x", "#y", "#z") signedness error");		\
+	__cmp(op, ux, __cmp(op, uy, uz)); })
+
 /**
  * min3 - return minimum of three values
  * @x: first value
  * @y: second value
  * @z: third value
  */
-#define min3(x, y, z) min((typeof(x))min(x, y), z)
+#define min3(x, y, z) \
+	__careful_op3(min, x, y, z, __UNIQUE_ID(x_), __UNIQUE_ID(y_), __UNIQUE_ID(z_))
 
 /**
  * max3 - return maximum of three values
@@ -166,7 +173,8 @@
  * @y: second value
  * @z: third value
  */
-#define max3(x, y, z) max((typeof(x))max(x, y), z)
+#define max3(x, y, z) \
+	__careful_op3(max, x, y, z, __UNIQUE_ID(x_), __UNIQUE_ID(y_), __UNIQUE_ID(z_))
 
 /**
  * min_not_zero - return the minimum that is _not_ zero, unless both are zero
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
