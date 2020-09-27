Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E826D27A2EB
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Sep 2020 21:55:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75D65C36B37;
	Sun, 27 Sep 2020 19:55:15 +0000 (UTC)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 778AAC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Sep 2020 19:55:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.77,311,1596492000"; d="scan'208";a="360169486"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES256-SHA256;
 27 Sep 2020 21:55:11 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: linux-iio@vger.kernel.org
Date: Sun, 27 Sep 2020 21:12:10 +0200
Message-Id: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
Cc: drbd-dev@lists.linbit.com,
 =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 David Lechner <david@lechnology.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-wireless@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-block@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
 Joe Perches <joe@perches.com>, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-acpi@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [Linux-stm32] [PATCH 00/18] use semicolons rather than commas to
	separate statements
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

These patches replace commas by semicolons.  This was done using the
Coccinelle semantic patch (http://coccinelle.lip6.fr/) shown below.

This semantic patch ensures that commas inside for loop headers will not be
transformed.  It also doesn't touch macro definitions.

Coccinelle ensures that braces are added as needed when a single-statement
branch turns into a multi-statement one.

This semantic patch has a few false positives, for variable delcarations
such as:

LIST_HEAD(x), *y;

The semantic patch could be improved to avoid these, but for the moment
they have been removed manually (2 occurrences).

// <smpl>
@initialize:ocaml@
@@

let infunction p =
  (* avoid macros *)
  (List.hd p).current_element <> "something_else"

let combined p1 p2 =
  (List.hd p1).line_end = (List.hd p2).line ||
  (((List.hd p1).line_end < (List.hd p2).line) &&
   ((List.hd p1).col < (List.hd p2).col))

@bad@
statement S;
declaration d;
position p;
@@

S@p
d

// special cases where newlines are needed (hope for no more than 5)
@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@r@
expression e1,e2;
statement S;
position p != bad.p;
@@

e1 ,@S@p e2;

@@
expression e1,e2;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && not(combined p1 p2) };
statement S;
position r.p;
@@

e1@p1
-,@S@p
+;
e2@p2
... when any
// </smpl>

---

 drivers/acpi/processor_idle.c               |    4 +++-
 drivers/ata/pata_icside.c                   |   21 +++++++++++++--------
 drivers/base/regmap/regmap-debugfs.c        |    2 +-
 drivers/bcma/driver_pci_host.c              |    4 ++--
 drivers/block/drbd/drbd_receiver.c          |    6 ++++--
 drivers/char/agp/amd-k7-agp.c               |    2 +-
 drivers/char/agp/nvidia-agp.c               |    2 +-
 drivers/char/agp/sworks-agp.c               |    2 +-
 drivers/char/hw_random/iproc-rng200.c       |    8 ++++----
 drivers/char/hw_random/mxc-rnga.c           |    6 +++---
 drivers/char/hw_random/stm32-rng.c          |    8 ++++----
 drivers/char/ipmi/bt-bmc.c                  |    6 +++---
 drivers/clk/meson/meson-aoclk.c             |    2 +-
 drivers/clk/mvebu/ap-cpu-clk.c              |    2 +-
 drivers/clk/uniphier/clk-uniphier-cpugear.c |    2 +-
 drivers/clk/uniphier/clk-uniphier-mux.c     |    2 +-
 drivers/clocksource/mps2-timer.c            |    6 +++---
 drivers/clocksource/timer-armada-370-xp.c   |    8 ++++----
 drivers/counter/ti-eqep.c                   |    2 +-
 drivers/crypto/amcc/crypto4xx_alg.c         |    2 +-
 drivers/crypto/atmel-tdes.c                 |    2 +-
 drivers/crypto/hifn_795x.c                  |    4 ++--
 drivers/crypto/talitos.c                    |    8 ++++----
 23 files changed, 60 insertions(+), 51 deletions(-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
